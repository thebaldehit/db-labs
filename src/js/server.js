'use strict';

require('dotenv').config();
const express = require('express');
const { PORT } = require('./config/config.js');
const userRouter = require('./routes/userRouter.js');

const app = express();

app.use(express.json());
app.use('/api', userRouter);

app.listen(PORT);