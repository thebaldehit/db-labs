const { Router } = require('express');
const { createUser, getAllUsers, getUser, updateUser, deleteUser } = require('../services/userServices.js');

const router = Router();

router.post('/', async (req, res) => {
  try {
    await createUser(req.body);
    res.status(200).end('ok');
  } catch (e) {
    const code = e.code ? e.code : 400;
    res.status(code).end(e.message);
  }
});

router.get('/', async (req, res) => {
  try {
    const users = await getAllUsers(req.body);
    res.status(200).end(users);
  } catch (e) {
    const code = e.code ? e.code : 400;
    res.status(code).end(e.message);
  }
});

router.get('/:id', async (req, res) => {
  try {
    const users = await getUser(req.params);
    res.status(200).end(users);
  } catch (e) {
    const code = e.code ? e.code : 400;
    res.status(code).end(e.message);
  }
});

router.put('/', async (req, res) => {
  try {
    const result = await updateUser(req.body);
    res.status(200).end(result);
  } catch (e) {
    const code = e.code ? e.code : 400;
    res.status(code).end(e.message);
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const result = await deleteUser(req.params);
    res.status(200).end(result);
  } catch (e) {
    const code = e.code ? e.code : 400;
    res.status(code).end(e.message);
  }
})

module.exports = router;