const express = require('express')
const router = express.Router()
const friendController = require('../controller/friendController')
const upload = require('../helpers/upload')


router.get('/',friendController.getFriends)
router.post('/',friendController.addFriend)
router.put('/:id',friendController.accFriend)
router.delete('/:id',friendController.deleteFriend)
module.exports = router