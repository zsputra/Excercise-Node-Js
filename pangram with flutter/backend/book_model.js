var mongoose = require('mongoose');
const service = require('./service.js')
const uniqid = require('uniqid');


internals = {}

// const connectionString = 'mongodb+srv://putraDkatalis:dkatalis94@cluster0-tb9fi.gcp.mongodb.net/test?retryWrites=true&w=majority'
const connectionString = 'mongodb://127.0.0.1:27017/pangram_db'
const bookSchema = new mongoose.Schema({
    // _id : mongoose.ObjectId ,
    title: {
        type: String,
        required: [true, 'Username is required']
    },
    url: {
        type: String,
        required: [true, 'Username is required']
    },
    pangrams: {
        type: Array,
        required: [true, 'Created date is required']
    }
})

const Book = mongoose.model('Book', bookSchema, 'pangram_collection')

async function createUser(book) {
    return new Book({
        title: book.title,
        url: book.url,
        pangrams: book.pangrams
    }).save()
}


async function findUser(username) {
    return await User.findOne({ username })
}

async function insertBookToDb(titles,urls){
    book = { title: titles, url: urls }
    book.pangrams = await (service.getListPangramFromBook(titles, urls))

    return await createUser(book)
}

 async function findAllBook(){
     let books = Array()
    mongoose.connect(connectionString, { useNewUrlParser: true })
    books = await  Book.find({})
    await mongoose.connection.close()
    return await books;

}

const init = async () => {
     mongoose.connect(connectionString, { useNewUrlParser: true })

    const titles = "Mid Summer Night Dream"
    const urls = "http://www.gutenberg.org/cache/epub/2242/pg2242.txt"

    book = await insertBookToDb(titles,urls)
    await mongoose.connection.close()
    await console.log(book)
    await console.log(books)
    await process.exit(0)
}


internals.findALlBookWithRandomPangram = async ()=>{
    let books = await findAllBook()
    let result = Array()
    let book_temp = {}
    await books.forEach((book) => {
        book_temp._id = book._id
        book_temp.title = book.title
        book_temp.url = book.url
        book_temp.pangrams = book.pangrams[service.randomNumber(book.pangrams.length)]
        result.push(book_temp)
    })
    return await result;
}

module.exports = internals;