'use strict';

const Path = require('path');
const Fs = require('fs');

const internals = {};

Fs.readdirSync(__dirname).forEach((file) => {
    if (file === 'index.js') {
        return;
    }

    const fileName = Path.basename(file, '.js');
    let handlerName = '';
    for (const s of fileName.split('_')) {
        handlerName += s.charAt(0).toUpperCase() + s.substring(1);
    }
    internals[handlerName] = require(Path.join(__dirname, file));
});

module.exports = internals;
