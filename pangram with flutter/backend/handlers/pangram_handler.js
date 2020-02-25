'use strict';

const datasource = require('../datasource.js');

const internal = {}

internal.randomPanagramHandler = async (response, h) => {
    return await datasource.getAllBookWithRandomPan()
        .catch(err => {
            throw err;
        });
}

module.exports = internal;
