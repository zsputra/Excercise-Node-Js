const axios = require('axios');
const readline = require('readline');
const LineReader = require('readline');

const TEXT_URL = "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt"

internals = {}

internals.textFile = async ()=>{
    const config = {
        method: 'get',
        url: TEXT_URL,
        responseType : 'stream'
    }
    let response = await axios(config)
    return response.data
}

// const readPanagramFromStream = function(downStream) {
//     const readStreamLine = LineReader.createInterface({
//             input: downStream,
//             // output: process.stdout,
//             console: false
//         });    


//     readStreamLine.on('line', function(line) {
//         console.log(line.toString())
        
//     });
    
// }

// internals.textFile()
module.exports = internals


