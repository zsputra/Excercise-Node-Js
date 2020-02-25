const fs = require('fs');
const axios = require('axios');
var tokenizer = require('sbd');
var MongoClient = require('mongodb').MongoClient;


const string = "abcdefghijklmnopqrstuvwxyz";
var url = "mongodb+srv://putraDkatalis:dkatalis94@cluster0-tb9fi.gcp.mongodb.net/test?retryWrites=true&w=majority";


const otherPangram = function (words) {
    return [...string].every(x => words.toLowerCase().includes(x));
}

var result = new Array();

async function makeGetRequest() {

    let res = await axios.get('http://www.gutenberg.org/cache/epub/2242/pg2242.txt');

    var optional_options = {};
    let data = res.data;
    data = data.toString();
    var sentences = tokenizer.sentences(data, optional_options);
    var temp = ""
    sentences.forEach(element => {
        if (otherPangram(element)) {
            result.push(temp);
        } else {
            temp = temp + " " + element;
            if (otherPangram(temp)) {
                result.push(temp);
                temp = ""
            }

        }
    })
    return result;

}

// makeGetRequest().then(value => console.log(value))


//MongoDb connection
MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    console.log("Database created!");
    db.close();
  });



