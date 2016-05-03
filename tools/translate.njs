#!/usr/local/bin/node

var client_config = require('./client_config.njs');
var http = require('http');
var queryString = process.argv[2];
var salt = Date.now();

var crypto = require('crypto');
var md5 = crypto.createHash('md5');
var signString = client_config.appid + queryString + salt + client_config.keygen;
signString = md5.update(signString).digest('hex');

var req = http.get("http://api.fanyi.baidu.com/api/trans/vip/translate?appid=" + client_config.appid + "&from=auto&to=auto&q=" + queryString + "&sign=" + signString + "&salt=" + salt, function(res) {
        //console.log('STATUS: ' + res.statusCode);
        //console.log('HEADERS: ' + JSON.stringify(res.headers));
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
                var chunk = JSON.parse(chunk);
                console.log(chunk.from + ': ' + chunk.trans_result[0].src + ' => ' + chunk.to + ': ' + chunk.trans_result[0].dst);
                //console.log(chunk);
        });
});

req.end();

