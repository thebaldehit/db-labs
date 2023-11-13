# Реалізація доступу до бази даних

```js
const mysql = require('mysql2/promise');
const { HOST, DB_USER, DB_PASS, DB_NAME } = require('../config/config.js');

const createConnection = async () => {
  const connection = await mysql.createConnection({
    host: HOST,
    user: DB_USER,
    password: DB_PASS,
    database: DB_NAME,
    namedPlaceholders: true
  });
  return connection;
};

module.exports = { createConnection };
```