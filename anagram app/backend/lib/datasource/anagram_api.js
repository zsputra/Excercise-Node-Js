const axios = require('axios');
const ANAGRAM_API_LOOKUP_URL = "http://www.anagramica.com/lookup/"

internals = {}

internals.validateWord = async (word)=>{
    const config = {
        method: 'get',
        url: ANAGRAM_API_LOOKUP_URL+word
    }
    let valid
    await axios(config).then((response) =>{
        let res =  response.data
        if(res.found == 0){
            valid = false
        }else{
            valid = true
        }
    })

    return await valid
    // console.log(res.toString())
}

module.exports = internals
