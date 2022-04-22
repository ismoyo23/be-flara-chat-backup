require('dotenv').config()
const express = require('express');
const connection = require('./src/helpers/mysql')
const ngrok = require('ngrok');
const morgan = require('morgan')
const app = express();
const server = require('http').createServer(app);
// const options = { /* ... */ };
const io = require('socket.io')(server);
var config = require('./src/config/global')
const bodyParser = require('body-parser');
const routes = require('./src/routes/index')
const session = require('express-session')
const cors = require("cors")
var whitelist = ['http://example2.com','http://localhost:8001','*','http://localhost:3000']
var corsOptions = {
  origin: function (origin, callback) {
    if(!origin) return callback(null, true);
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true)
    } else {
      callback(new Error('Not allowed by CORS'))
    }
  }
}

app.use(cors(corsOptions))
app.use('/uploads',express.static('./uploads'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan('dev'))

io.on('connection',socket =>{
  console.log("New User Connect")
  socket.on('disconnect',()=>{
    console.log('User disconnect')
  })
  socket.on('read',(msg)=>{
    console.log(msg)
    })
  // socket.disconnect()
})
app.use((req,res,next)=>{
  req.io = io;
  next()
})
app.use('/',routes)

connection.connect(function(){
    console.log('Database Chat Connect')
})

server.listen(config.app.port,function(){
    console.log('App has running in port '+ config.app.port)
    ngrok.connect(config.app.port, function (err, url) {
      console.log(`Node.js local server is publicly-accessible at ${url}`);
  });
})