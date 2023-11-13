# SQL-скрипти

В цьому розділі розміщені сирцеві коди для створення бази даних.

```js
'use strict';

require('dotenv').config()
const path = require('node:path');
const mysql = require('mysql2');
const fs = require('node:fs');
const { HOST, DB_USER, DB_PASS } = require('../config/config.js');

console.log(HOST, DB_USER, DB_PASS);

const script = fs.readFileSync(path.resolve(__dirname, '..', '..', 'sql', 'db.sql'), 'utf8');

const connection = mysql.createConnection({
  host: HOST,
  user: DB_USER,
  password: DB_PASS,
  multipleStatements: true,
});

connection.query(script, (err, results) => {
  if (err) console.error('Помилка виконання SQL-скрипта:', err);
  else console.log('База даних та таблиці успішно створені.');
  connection.end();
});
```