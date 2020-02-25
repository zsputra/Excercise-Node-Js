'use strict';

const Path = require('path');
const Fs = require('fs');

const internals = {};

Fs.readdirSync(__dirname).forEach((file) => {
    if (file === 'index.js') {
        return;
    }
    const routeFilename = Path.basename(file, '.js');
    internals[routeFilename] = require(Path.join(__dirname, file));
});

const exposeRoutes = [];

for (const routeName in internals) {
    internals[routeName].forEach((route) => {
        exposeRoutes.push(route);
    });
}

module.exports = exposeRoutes;
