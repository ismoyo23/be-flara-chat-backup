const mysql = require('mysql');//mysql
const config = require('../config/global')//import config
const connection = mysql.createConnection({
    host : config.mysql.host,
    user : config.mysql.user,
    password : config.mysql.password,
    database : config.mysql.database,
    timezone : 'Z',
    dateStrings : true
})

module.exports = connection