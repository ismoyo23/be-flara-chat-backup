const connection = require('../helpers/mysql');
const Haspass = require('bcrypt');
const res = require('../helpers/res');
const moment = require('moment');
const { func } = require('@hapi/joi');


module.exports = {
    addFriends : function (data) {
        return new Promise((resolve,reject)=>{
            connection.query('INSERT INTO relations SET ?',data,function (error,result) {
                if(error){
                    reject(error)
                }
                const data = {
                    ...result
                }
                resolve(data)
            })        
        })
    },
    getFriend : function (data) {
        return new Promise((resolve,reject)=>{
            connection.query(`SELECT R.id,R.id_friends,F.name as friendName,F.email as friendEmail,F.image as friendImage ,F.bio as friendBio,F.loc as friendLoc,
            R.id_users,U.name as name,U.email as email,U.image as image ,U.bio as bio,U.loc as loc
            ,U.created_at,U.updated_at,F.created_at as friendCreated_at,F.updated_at as friendUpdated_at,R.acc_at FROM relations R INNER JOIN users F ON R.id_friends = F.id 
            INNER JOIN users U ON R.id_users = U.id WHERE id_users =? OR id_friends =? ORDER BY U.name ASC`,[data,data],function(error,result) {
                if(error){
                    reject(error)
                }     
                resolve(result)
            })
        })
    },
    editFriend : function  (data,id) {
        return new Promise((resolve,reject)=>{
            connection.query('UPDATE relations SET ? WHERE id = ?',[data,id],function (error,result) {
                if (error) {
                    reject(error)
                }
                resolve(result)
                
            })
        })
    },
    delete : function (id) {
        return new Promise((resolve,reject)=>{
            connection.query("DELETE FROM relations WHERE id = ?",id,function (error,result) {
                if(error){
                    reject(error)
                }
                resolve(result)
            })
        })
    }
}