/**
 * Created by ly on 15-6-29.
 */
"use strict";
const path        = require("path");
const config      = require(path.join(process.cwd(), "server/config"));
const log         = require("../log/boleLog").boleLog;
const mongoose    = require("mongoose");

mongoose.Promise = require('bluebird');
let msurl="";
if(config.multinodeMongodb.isOpen){
    let pass=config.multinodeMongodb.pass.replace(/@/,'%3A');
    // ip.forEach((item,index)=>{
    //     msurl+=usr[index]+':'+pass[index]+':'+"@"+ip[index]+','
    // })
    // msurl=usr+'%3A'+pass+"@"+ip;
    msurl=`${config.multinodeMongodb.user}%3A${pass}@${config.multinodeMongodb.host}`;
}else{
    msurl=`${config.mongodb.user}:${config.mongodb.pass}@${config.mongodb.host}:${config.mongodb.port}`
}

 const mongodb= function(){
    let env = process.env.NODE_ENV;
    let mongodb = false;
    if(config.mongodb.on){
        let DB_URL = "";
        if( !!config.mongodb.user && !! config.mongodb.pass && config.multinodeMongodb.isOpen) DB_URL = `mongodb://${msurl}/${config.mongodb.schema}`;
        else DB_URL = `mongodb://${msurl}/${config.mongodb.schema}`;
        mongoose.connect(DB_URL,{
                useMongoClient: true,
                reconnectTries: Number.MAX_VALUE,
                server: { socketOptions: { keepAlive: 120, connectTimeoutMS: 30000 },
                auto_reconnect:true,
                reconnectTries:30,
                reconnectInterval:3000,
                poolSize:10
            }
        });
        console.log(DB_URL);
        mongodb = mongoose.connection;
        mongodb.on('error', console.error.bind(console, 'connection error:'));
        mongodb.once('open', function (callback) {
            log.info("Mongodb open successful!");
            log.info("mongoHost："+msurl+"               mongoSchema："+config.mongodb.schema);
        });
    }
    return mongodb;
}
module.exports=mongodb