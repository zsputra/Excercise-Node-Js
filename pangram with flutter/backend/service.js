
const axios = require('axios');
const tokenizer = require('sbd');

const datasource = require('./datasource.js')

const internals = {}

const string = "abcdefghijklmnopqrstuvwxyz";


const isPangram = function (words) {
    return [...string].every(x => words.toLowerCase().includes(x));
}

var result = new Array();

internals.getListPangramFromBook = async function(title, url, image) {

    // let res = await axios.get('http://www.gutenberg.org/cache/epub/2242/pg2242.txt');
    let res = await axios.get(url);

    const book = {}
    var optional_options = {};
    let data = res.data.toString();
    var sentences = tokenizer.sentences(data, optional_options);
    var temp = ""
    await sentences.forEach(element => {
        if (isPangram(element)) {
            result.push(temp);
        } else {
            temp = temp + " " + element;
            if (isPangram(temp)) {
                result.push(temp);
                temp = ""
            }

        }
    })

    book.title = title
    book.url = url
    book.image = image
    book.pangrams = result

    return book

}

internals.randomNumber = function(max) {
    return (Math.floor(Math.random() * Math.floor(max))) ;
  }

internals.getBooksWithRandomPangram = async ()=>{
    let listAllBook 
    datasource.getAllBook().then((v) => {
        listAllBook = v
    })
    // let results = new Array()
    // await listAllBook.forEach((v)=>{
    //     const bookResult = {}
    //     bookResult._id = v._id
    //     bookResult.title = v.title
    //     bookResult.url = v.url
    //     bookResult.pangrams = v.pangrams[randomNumber(v.pangrams.length)]
    //     results.push(bookResult)
    // })
    return await listAllBook
}

internals.getBookByTitle =  (title)=>{
    let listAllBook = datasource.coba();
    return  listAllBook
}

// console.log(datasource.coba())

module.exports = internals
