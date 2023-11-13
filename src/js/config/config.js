const PORT = process.env.PORT ?? 8000;
const HOST = process.env.HOST ?? 'localhost';
const DB_PASS = process.env.DB_PASS;
const DB_NAME = process.env.DB_NAME;
const DB_USER = process.env.DB_USER;

module.exports = { PORT, HOST, DB_PASS, DB_NAME, DB_USER };