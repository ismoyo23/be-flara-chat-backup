const connection = require('../helpers/mysql');
const Haspass = require('bcrypt');
const res = require('../helpers/res');
const moment = require('moment');

module.exports = {
    addMessage : function (data) {
        const dataInput = data
        return new Promise((resolve,reject)=>{
            connection.query("INSERT INTO messages set?",dataInput,function (error,result) {
                if(error){
                    reject(error)
                }
                const resultData = {
                    ...result
                }
                newMessage = {
                    id : resultData.insertId,
                    ...dataInput,
                    read_at : null,
                    created_at : moment(Date.now()).format('YYYY-MM-DD HH:mm:ss'),
                    updated_at : moment(Date.now()).format('YYYY-MM-DD HH:mm:ss')
                }
                resolve(newMessage)
            })
        })
    },
    edit : function (data) {
        return new Promise((resolve,reject)=>{
            connection.query("UPDATE messages SET ? WHERE id= ?",[data,id],function (error,result) {
                if (error) {
                    reject(error)
                }
                resolve(result)
            })
        })
    },
    getAllmessages : function (data) {
        console.log(data)
        return new Promise((resolve,reject)=>{
            connection.query("SELECT * FROM messages WHERE id_users=? AND id_sendTo=? OR id_users=? AND id_sendTo=?",[data.id_users,data.id_sendTo,data.id_sendTo,data.id_users],function (error,result) {
                if(error){
                    reject(error)
                }
                const data = {
                    data : result
                }
                console.log(result)
                resolve(data)
            })
        })
    },
    listMessage : function (data) {
        return new Promise((resolve,reject)=>{
            connection.query(`select m.id,m.id_users,users.name as sender,users.image as senderImage,m.id_sendTo,R.name as reciver,R.image as reciverImage,m.messages,m.read_at,m.created_at,m.updated_at
            from 
            messages m
            left join messages m1 on (
              (
                (m.id_users = m1.id_users and m.id_sendTo = m1.id_sendTo)
                                      or
                (m.id_users = m1.id_sendTo and m.id_sendTo = m1.id_users )
              )
               and case when m.created_at = m1.created_at
                        then m.id < m1.id
                        else m.created_at < m1.created_at
                   end
            )
            INNER JOIN users ON m.id_users = users.id INNER JOIN users R on m.id_sendTo = R.id
            where m1.id is null
            and ? in(m.id_users, m.id_sendTo) ORDER BY m.created_at DESC`,data,function (error,result) {
                if (error) {
                    reject(error)
                }
                resolve(result)
            })
        })
        
    },
    deleteMessage : function (data) {
        return new Promise((resolve,reject)=>{
            connection.query('DELETE FROM messages WHERE id_sendTo = ?',data,function (error,result) {
                if(error){
                    reject(error)
                }
                const res = {
                    msg : 'Messages Deleted'
                }
                resolve(res)
            })
        })        
    },
    markAsRead : function (content,data){
        return new Promise((resolve,reject)=>{
            connection.query("UPDATE messages SET ? WHERE id_users=? AND id_sendTo=? AND messages.read_at IS NULL",[content,data.id_sendTo,data.id_users],function (error,result) {
                if(error){
                    reject(error)
                }
                resolve(result)
            })
        })
    }
}