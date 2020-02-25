const uniqid = require('uniqid');
const service = require('../service/anagram.js')
const anagramApi = require('../datasource/anagram_api')
const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://putraDkatalis:dkatalis94@cluster0-tb9fi.gcp.mongodb.net/test?retryWrites=true&w=majority";
// const uri = "mongodb://localhost:27017"
const client = () =>
    new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });


const internals = {}

let init = (word) => {
    const wordModel = {}
    wordModel.key = service.sortString(word).join("")
    wordModel.word = word
    return wordModel
}

internals.insertWords = async (word) => {
    let wordModel = init(word)
    let db = await client().connect();
    let dbo = db.db("anagram_db")
    dbo.collection("anagrams").insertOne(wordModel).then(() => db.close())

}

internals.validateWordInDb = async (word) => {
    let db = await client().connect();
    let dbo = db.db("anagram_db")
    let result = await dbo.collection("anagrams").find({ "key": service.sortString(word).join("") }, { $exists: true }).toArray();
    await db.close()
    if (result.length == 0) {
        return false
    }
    return true
}

internals.insertUpdate = async (word) => {
    let db = await client().connect();
    let dbo = db.db("anagram_db")
    let wordModel = init(word)
    dbo.collection("anagrams").updateOne(
        wordModel,
        { $set: { word: wordModel.word } },
        { upsert: true }
    ).finally(() => db.close());
}



internals.insertMany = async (Words) => {
    let db = await client().connect();
    let dbo = db.db("anagram_db")
    dbo.collection("anagrams").insertMany(Words, function (err, res) {
        if (err) throw err;
        console.log("Number of documents inserted: " + res.insertedCount);
        db.close();
    });
}

internals.getAnagrams = async (keyword) => {
    let db = await client().connect()
    let dbo = db.db("anagram_db")
    let pipline = [
        {
            $group:
            {
                _id: '$key',
                'count': { '$sum': 1 },
                'data': { $addToSet: '$word' }
            }

        },
        {
            $match:

            {
                count: {
                    $gt: 1
                },
                _id: { $eq: service.sortString(keyword).join('') }
            }
        }
    ]
    let result = (await dbo.collection("anagrams").aggregate(pipline).toArray())

    let datas = result[0].data
    result[0].data = await validateData(datas)
    return result;

}

const validateData = async(datas)=>{
    let rest = []

    for (data of datas) {
        const v = await anagramApi.validateWord(data);
        if (v) {
            rest.push(data)
        }
    };
    return rest
}

internals.getListOfAnagrams = async () => {
    let db = await client().connect()
    let dbo = db.db("anagram_db")
    let pipline = [
        {
            $group:
            {
                _id: '$key',
                'count': { '$sum': 1 },
                'data': { $addToSet: '$word' }
            }

        },
        {
            $match:

            {
                count: {
                    $gt: 4
                }
            }
        },
        { $sample: { size: 1 } }
    ]
    let list = await dbo.collection("anagrams").aggregate(pipline).toArray()
    for(index in list){
        let datas = list[index].data
        list[index].data = await validateData(datas)
    }
    return list
}

internals.getTheValidListOfAnagram = async ()=>{
        let result = await internals.getListOfAnagrams()
        if(result[0].data.length >= 2){
            return result   
        }else{
            return internals.getTheValidListOfAnagram()
        }
}

// internals.getTheValidListOfAnagram().then((c)=>console.log(c))


module.exports = internals
