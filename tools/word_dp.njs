#!/usr/local/bin/node

var client_config = require('./client_config.njs');
var http = require('http');
var urlencode = require('urlencode');
var queryString = urlencode(process.argv[2]);

var req = http.get("http://ltpapi.voicecloud.cn/analysis/?api_key=" + client_config.xunfei_yuyinyun_apikey + "&pattern=ws&format=json&text=" + queryString, function(res) {
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
                //console.log(chunk);
                //var chunk = JSON.parse(chunk);
                console.log(chunk);
        });
});

req.end();
