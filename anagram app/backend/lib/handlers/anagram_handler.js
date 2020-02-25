'use strict';

const datasource = require('../datasource/mongodb.js');
const service = require('../service/anagram.js')

const internal = {}

internal.getListAnagrams = async (response, h) => {
    return datasource.getTheValidListOfAnagram()
}

internal.getAnagramFromKeyworkd = async (req, h) => {
    const keyword = req.params.keyword;
    return datasource.getAnagrams(keyword)
}

internal.postAnagram = async (req, h) => {

    const list = req.payload.words
    const data = service.isAnagram(list[0], list[1])

    return {"isAnagram" : data}

}

internal.isIsogram = async (req, h) => {

    const word = req.params.word
    const data = service.isIsogramUseRegex(word)

    return {"isIsogram" : data}

}


module.exports = internal;
