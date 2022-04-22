const express = require('express');
const router = express.Router()
const app = express()
const authRoute = require('./auth');
const AuthMiddleware= require('../middleware/auth');
const chatRoute = require('./chat');
const friendRoute = require('./friend');

router.use('/api/users',authRoute)
router.use('/api/chat',chatRoute)
router.use('/api/friend',AuthMiddleware.Authorization,friendRoute)
module.exports = router