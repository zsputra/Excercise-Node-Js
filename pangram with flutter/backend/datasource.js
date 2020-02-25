const uniqid = require('uniqid');
const service = require('./service.js')

const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://putraDkatalis:dkatalis94@cluster0-tb9fi.gcp.mongodb.net/test?retryWrites=true&w=majority";
const client = () =>
    new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });


const internals = {}



const insertToDb = async (value) => {
    let db = await client().connect();
    let dbo = db.db("pangram_db");
    const idBook = uniqid()
    book = { "title": value.title, "url": value.url, "image" : value.image, _id: idBook }
    dbo.collection("pangram_book").insertOne(book).then(() => { db.close() })

    value.pangrams.forEach(async (v) => {
        let db = await client().connect();
        let dbo = db.db("pangram_db");
        pangram = { "book_id": idBook, "pangrams": v, _id: uniqid() }
        dbo.collection("pangrams").insertOne(pangram).then(() => { db.close() })
    })

}



internals.insertBookToDb = (title, url, image) => {
    service.getListPangramFromBook(title, url, image).then(value => {
        insertToDb(value)
    })
}

// internals.insertBookToDb("Mid Summer Night Dream 2", "http://www.gutenberg.org/cache/epub/2242/pg2242.txt");

internals.getBookByTitle = async function (title) {
    var db = await client().connect();
    var dbo = db.db("pangram_db");
    return await dbo.collection("pangram_book").findOne({ "title": title }).finally(() => { db.close() });

}

internals.coba = () => {
    return "coba"
}

internals.getAllBook = async () => {
    var db = await client().connect();
    var dbo = db.db("pangram_db");
    return await dbo.collection("pangram_book").find().toArray().finally(() => { db.close() });

}

internals.getAllBookWithRandomPan = async () => {
    const db = await client().connect();
    const dbo = db.db("pangram_db")
    const result = await dbo.collection("pangrams").aggregate([
        {
            $lookup:
            {
                from: 'pangram_book',
                localField: 'book_id',
                foreignField: '_id',
                as: 'book'
            }
        },

        {
            $unwind: {
                path: '$book',
                preserveNullAndEmptyArrays: true
            }
        }, {
            $project: {
                title: '$book.title',
                url: '$book.url',
                image: '$book.image',
                pangrams: '$pangrams'
            }
        },
        { $sample: { size: 1 } }
    ]).toArray()
    return result;
}

internals.getAllBooksResult = async () => {
    let results = new Array()
    await internals.getAllBook().then((v) => {
        v.forEach((b) => {
            const bookResult = {}
            bookResult._id = b._id
            bookResult.title = b.title
            bookResult.url = b.url
            bookResult.pangrams = b.pangrams[service.randomNumber(b.pangrams.length)]
            results.push(bookResult)
        })
    })
    return await results
}

module.exports = internals;


