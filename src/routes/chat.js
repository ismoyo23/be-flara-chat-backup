const express = require('express')
const router = express.Router()
const chatController = require('../controller/chatController');
const upload = require('../helpers/upload');
const { route } = require('./auth');

router.post('/',chatController.addChat)
router.get('/:sendTo',chatController.getAll)
router.get('/',chatController.chatList)
router.put('/:sendTo',chatController.markAsRead)
router.delete('/:id',chatController.deleteMessage)

module.exports = router