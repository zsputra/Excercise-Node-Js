const axios = require('axios');
const BASE_URL = "https://od-api.oxforddictionaries.com/api/v2"

internals = {}

internals.getValidate = async(word)=>{
    // const _url = BASE_URL+"/entries/en/"+word
    const _url = "https://od-api.oxforddictionaries.com/api/v2/entries/en/coba"
    const config = {
        method: 'get',
        url: _url,
        headers: { 'Accept': 'application/json', 'app_key' : '4ed13474c4b2358752e08ad68e94b54b', 'app_id' : '2baa2f30' }
    }

    let res 
    await axios(config).then((response) =>{
        res =  response.data.toString()
    }).catch((err)=>{
        res =  "Not an English Word"
    })
    // console.log(res.toString())
    return await res
}

// internals.getValidate("coba").then((v)=>console.log(v))


module.exports = internals