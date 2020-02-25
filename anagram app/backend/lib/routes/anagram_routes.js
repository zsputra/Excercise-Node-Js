'use strict';

const handlers = require('../handlers')

const internal = {}

internal.routes = [
    {
        method: 'GET',
        path: '/anagram',
        options: {
            handler: handlers.AnagramHandler.getListAnagrams,
            description: 'Get Random anagram',
            notes: 'Returns Random anagram',
            tags: ['api'],
        }
    },
    {
        method: 'GET',
        path: '/anagram/{keyword}',
        options: {
            handler: handlers.AnagramHandler.getAnagramFromKeyworkd,
            description: 'Get Random anagram',
            notes: 'Returns Random anagram',
            tags: ['api'],
        }
    },
    {
        method: 'POST',
        path: '/anagram',
        options: {
            handler: handlers.AnagramHandler.postAnagram,
            description: 'Get Random anagram',
            notes: 'Returns Random anagram',
            tags: ['api'],
        }
    },
    {
        method: 'GET',
        path: '/isogram/{word}',
        options: {
            handler: handlers.AnagramHandler.isIsogram,
            description: 'Get Random anagram',
            notes: 'Returns Random anagram',
            tags: ['api'],
        }
    }
];

module.exports = internal.routes;
