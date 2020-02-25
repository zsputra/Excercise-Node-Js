'use strict';

const Lab = require('@hapi/lab');
const { expect } = require('@hapi/code');
const { afterEach, beforeEach, describe, it } = exports.lab = Lab.script();
const { init } = require('../server');

describe('GET /', async () => {
    let server;

    beforeEach(async () => {
        server = await init();
    });

    afterEach(async () => {
        await server.stop();
    });

    it('responds with 200', { timeout: 30000 }, async () => {
        const res = await server.inject({
            method: 'get',
            url: '/pangram'
        });
        expect(res.statusCode).to.equal(200);
    });
});
