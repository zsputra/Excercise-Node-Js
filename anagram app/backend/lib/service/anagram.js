const axios = require('axios');
const LineReader = require('readline');
const textApi = require('../datasource/text_file.js')
const dataMongo = require('../datasource/mongodb.js')
const anagramApi = require('../datasource/anagram_api')

const TEXT_URL = "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt"


internals = {}

internals.sortString = (str)=>{
    var arr = str.split('');
    return arr.sort();

  }

internals.isAnagram = (word1, word2)=>{
    let sortedWord1 = word1.split('').sort()
    let sortedWord2 = word2.split('').sort()
    if(sortedWord1.length != sortedWord2.length){
        return false
    }
    for(i in sortedWord1){
        if(sortedWord1[i]!=sortedWord2[i]){
            return false
        }
    }
    return true
    
}

internals.textFile = async ()=>{
    const config = {
        method: 'get',
        url: TEXT_URL,
        // responseType : 'stream'
    }
    let response = await axios(config)
    // readPanagramFromStream(response.data)
    let lists = await response.data.toString().split("\n")
    let listAnagramModel = []
    
    lists.forEach( (element) => {
        let Model = {
            word : element,
            key : internals.sortString(element).join("")
        }
        listAnagramModel.push(Model)
    });
    console.log(listAnagramModel)
    dataMongo.insertMany(listAnagramModel)
    console.log(done)
}

internals.getAnagramsByKeyword = async (keyword)=>{
    const list =  await dataMongo.getAnagrams(keyword);
    return list;
}



const readPanagramFromStream =   function(downStream) {
    const readStreamLine = LineReader.createInterface({
            input: downStream,
            console: false
        });    


    readStreamLine.on('line', async function(line) {
        let anagramApiValidate = await anagramApi.validateWord(line.toString)
        console.log(anagramApiValidate)
      
    });

    readStreamLine.on("close", ()=>{
        console.log("finished")
    })
    
}

internals.isIsogram = (word)=>{
    let mySet = new Set()
    let array = word.split("")
    array.forEach((v)=>{
        mySet.add(v)
    })
    return array.length == mySet.length
}

internals.isIsogramUseRegex = (word)=>{
        return !/(\w+).*\1/.test(word);
    
}

// console.log(internals.isIsogramUseRegex("latdhfjfyjla --e"))

// internals.textFile()

// anagramApi.validateWord("broke").then(v => console.log(v))

// internals.textFile()
module.exports = internals
