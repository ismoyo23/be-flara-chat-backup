const helper = require('../helpers/res')
const multer = require('multer');
const path   = require('path');
const queryString = require('querystring');
const moment = require('moment');
const chat = require('../models/chat')
const Joi = require('@hapi/joi');
const jwt = require('jsonwebtoken');
const { response } = require('../helpers/res');
const config = require('../config/global');
const { connected } = require('process');
// setData.updated_at = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');


module.exports = {
    addChat : async function (req,res) {
        try {
            const userCredentials = await jwt.verify(req.headers.authorization,config.app.secret_key)
            const data = {
                id_users : userCredentials.data.id,
                messages : req.body.messages,
                id_sendTo : req.body.sendTo,
                // created_at : 'defaultStatus',
                // updated_at : 'dasdsad'
            }
            const result = await chat.addMessage(data)
            console.log(result)
            req.io.emit('chat',result)
            return helper.response(res,'success',result,200)   
        } catch (error) {
            console.log(error)
            return helper.response(res,'error',error,500)
        }
    },
    edit : async function (req,res) {
        try {
            
        } catch (error) {
            
        }
    },
    getAll : async function (req,res) {
        console.log(req.params.sendTo)
        try {
            const userCredentials = await jwt.verify(req.headers.authorization,config.app.secret_key)
            const data = {
                id_users : userCredentials.data.id,
                id_sendTo : req.params.sendTo,
            }
            const result = await chat.getAllmessages(data)
            return helper.response(res,'success',result,200) 
        } catch (error) {
            return helper.response(res,'fails',error,500)
        }
    },
    chatList : async function (req,res) {
        try {
            const user = await jwt.verify(req.headers.authorization,config.app.secret_key).data
            const result = await chat.listMessage(user.id)
            const dataRes = {
                data : result
            }
            return helper.response(res,'success',dataRes,200)
        } catch (error) {
            return helper.response(res,'fails',error,500)
        }
    },
    markAsRead : async function (req,res) {
        try {
            const userCredentials = await jwt.verify(req.headers.authorization,config.app.secret_key)
            const data = {
                id_users : userCredentials.data.id,
                id_sendTo : req.params.sendTo,
            }
            const content = {
                read_at : moment(Date.now()).format('YYYY-MM-DD HH:mm:ss')
            }
            console.log(data)
            const result = await chat.markAsRead(content,data)
            return helper.response(res,'success',result,200)
        } catch (error) {
            return helper.response(res,'fails',error,500)
        }
    },
    deleteMessage : async function (req,res) {
        const id = req.params.id
        try {
            const result = chat.deleteMessage(id)
            return helper.response(res,'success',result,200) 
        } catch (error) {
            return helper.response(res,'fails',error,500)
        }
    }
}