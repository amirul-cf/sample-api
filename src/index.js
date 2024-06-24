// Require the framework and instantiate it
const fastify = require('fastify')({ logger: true });
const products = require('./data/products.json');

// Declare a route
fastify.get('/', function handler(request, reply) {
    reply.send({ hello: 'world' });
})

fastify.get('/products', (req, rep) => {
    rep.send(products);
})

// Run the server!
fastify.listen({ port: 3000 }, (err) => {
    if (err) {
        fastify.log.error(err)
        process.exit(1)
    }
})