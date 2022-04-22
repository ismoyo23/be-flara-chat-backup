const connection = require('../helpers/mysql')
const helper = require('../helpers/res')
const multer = require('multer');
const path   = require('path');
const queryString = require('querystring');
const moment = require('moment');
const friends = require('../models/friend')
const Joi = require('@hapi/joi');
const jwt = require('jsonwebtoken');
const config = require('../config/global')
const auth = require('../models/auth');
const friend = require('../models/friend');
// setData.updated_at = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
// const { cpus } = require('os');

module.exports = {
    getFriends : async function (req,res) {
        try {
            // console.log(req.io)
            const user = jwt.verify(req.headers.authorization,config.app.secret_key).data
            const result = await friends.getFriend(user.id)
            const data = {
                data : result
            }
            return helper.response(res,'success',data,200)
        } catch (error) {
            // console.log(error)
            return helper.response(res,'fail',error,500)
        }
    },
    addFriend : async function (req,res) {
        const data = req.body
        try {
            const user = jwt.verify(req.headers.authorization,config.app.secret_key).data
            data.id_users = user.id
            const friendList = await friends.getFriend(user.id)
            const friendEmail = await auth.getDetails(data.email)
            const newFriend =  friendList.filter(function(items,i) {
                return items.id_friends == friendEmail.data.id && items.id_users == user.id || items.id_friends == user.id && items.id_users == friendEmail.data.id
            })
            if(newFriend.length >= 1 ){
                const data = {
                    msg : 'has become your friend'
                }
                return helper.response(res,'success',data,200)
            }
            else{
                data.id_friends = friendEmail.data.id
                delete data.email
                const result = await friends.addFriends(data)
                const response = {
                    data : result,
                    msg : 'now is your friend'
                }
                console.log(response)
                return helper.response(res,'success',response,200)
            }
        } catch (error) {
            console.log(error)
            return helper.response(res,'fails',error,500)
        }
    },
    accFriend : async function (req,res) {
        const id = req.params.id
        try {
            data = {
                acc_at : moment(Date.now()).format('YYYY-MM-DD HH:mm:ss')
            }
            const result = await friends.editFriend(data,id)
            return helper.response(res,'success',result,200)
        } catch (error) {
            return helper.response(res,'fails',error,500)
        }
    },
    deleteFriend : async function (req,res) {
        const id = req.params.id
        try {
            const result = await friends.delete(id)
            return helper.response(res,'success',result,200)
        } catch (error) {
            return helper.response(res,'fails',error,500)
        }
    }
}