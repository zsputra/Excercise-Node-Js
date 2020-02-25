'use strict';

const handlers = require('../handlers')

const internal = {}

internal.routes = [
    {
        method: 'GET',
        path: '/pangram',
        options: {
            handler: handlers.PangramHandler.randomPanagramHandler,
            description: 'Get Random Pangram',
            notes: 'Returns Random Pangram',
            tags: ['api'],
        }
    }
];

module.exports = internal.routes;
