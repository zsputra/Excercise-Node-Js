'use strict';

const Hapi = require('@hapi/hapi');
const Inert = require('@hapi/inert');
const Vision = require('@hapi/vision');
const HapiSwagger = require('hapi-swagger');
const Pack = require('./package');
// const mongo = require('./mongo');
const routes = require('./routes');

const server = Hapi.server({
    port: process.env.PORT || 3000,
    host: '0.0.0.0'
});

const swaggerOptions = {
    info: {
        title: 'Random Pangram API Documentation',
        version: Pack.version,
    },
};

server.route(routes);

exports.init = async () => {
    await server.initialize();
    return server;
};

exports.start = async () => {
    // await mongo.getRandomPangram();
    await server.register([
        Inert,
        Vision,
        {
            plugin: HapiSwagger,
            options: swaggerOptions
        }
    ]);
    await server.start();
    console.log(`Server running at: ${server.info.uri}`);
    return server;
};

process.on('error', (err) => {
    console.log(err);
    process.exit(1);
});
