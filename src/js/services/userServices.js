const crypto = require('node:crypto');
const { createConnection } = require('../db/pool.js');
const { DB_NAME } = require('../config/config.js');

const getMaxId = async () => {
  const sql = `SELECT MAX(id) AS maxId FROM ${DB_NAME}.user`;
  const connection = await createConnection();
  const [ result ] = await connection.execute(sql);
  await connection.end();
  return result[0].maxId;
}

const hashPassword = (password) => {
  const hash = crypto.createHash('sha256');
  hash.update(password);
  const hashedPassword = hash.digest('hex');
  return hashedPassword;
}

const objForSEnding = (array) => {
  const users = [];
  for (const item of array) {
    users.push({
      first_name: item.first_name,
      last_name: item.last_name,
      username: item.username,
      email: item.email,
    });
  }
  return users;
}

const validateBody = (body) => {
  if (!body) throw new Error('No data');
  if (!body.password) throw new Error('No password');
  if (!body.email) throw new Error('No email');
  if (!body.username) throw new Error('No username');
  if (!body.first_name) throw new Error('No firstName');
  if (!body.last_name) throw new Error('No lastName');
}

const createUser = async (body) => {
  try { validateBody(body) }
  catch (err) { throw err };
  const maxId = await getMaxId() + 1;
  const hashPass = hashPassword(body.password);
  const roleId = 1;
  const sql = `INSERT INTO ${DB_NAME}.user (id, first_name, last_name, username, email, password, role_id) VALUES (?, ?, ?, ?, ?, ?, ?)`;
  const values = [maxId, body.first_name, body.last_name, body.username, body.email, hashPass, roleId];
  const connection = await createConnection();
  try {
    await connection.execute(sql, values);
  } catch (e) {
    e.code = 500;
    throw e;
  } finally {
    await connection.end();
  }
};

const getAllUsers = async (body) => {
  const sql = `SELECT * FROM ${DB_NAME}.user`;
  const connection = await createConnection();
  try {
    const [ result ] = await connection.execute(sql);
    const users = objForSEnding(result);    
    return JSON.stringify(users);
  } catch (e) {
    e.code = 500;
    throw e;
  } finally {
    await connection.end();
  }
}

const getUser = async (params) => {
  const id = +params.id;
  if (isNaN(id)) throw new Error('Incorrect id');
  const sql = `SELECT * FROM ${DB_NAME}.user WHERE id = ?`;
  const connection = await createConnection(); 
  try {
    const [ result ] = await connection.execute(sql, [ id ]);
    const users = objForSEnding(result);    
    return JSON.stringify(users);
  } catch (e) {
    e.code = 500;
    throw e;
  } finally {
    await connection.end();
  }
}

const updateUser = async (body) => {
  try { validateBody(body) }
  catch (err) { throw err };
  const id = +body.id;
  delete body.id;
  if (!id || isNaN(id)) throw new Error('Incorrect id');
  const hashPass = hashPassword(body.password);
  const sql = `UPDATE ${DB_NAME}.user SET first_name = ?, last_name = ?, username = ?, email = ?, password = ? WHERE id = ?`;
  const values = [body.first_name, body.last_name, body.username, body.email, hashPass, id];
  const connection = await createConnection(); 
  try {
    await connection.execute(sql, values);
    return;
  } catch (e) {
    e.code = 500;
    throw e;
  } finally {
    await connection.end();
  }
}

const deleteUser = async (params) => {
  const id = +params.id;
  if (isNaN(id)) throw new Error('Incorrect id');
  const sql = `DELETE FROM ${DB_NAME}.user WHERE id = ?`;
  const connection = await createConnection(); 
  try {
    await connection.execute(sql, [ id ]);
    return;
  } catch (e) {
    e.code = 500;
    throw e;
  } finally {
    await connection.end();
  }
}

module.exports = { createUser, getAllUsers, getUser, updateUser, deleteUser };