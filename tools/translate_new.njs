#!/usr/local/bin/node

var client_config = require('./client_config.njs');
var http = require('http');
var urlencode = require('urlencode');
var queryString = urlencode(process.argv[2]);

var req = http.get("http://fanyi.youdao.com/openapi.do?keyfrom=" + client_config.keyfrom + "&key=" + client_config.apikey + "&type=data&doctype=json&version=1.1&q=" + queryString, function(res) {
        //console.log('STATUS: ' + res.statusCode);
        //console.log('HEADERS: ' + JSON.stringify(res.headers));
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
                var chunk = JSON.parse(chunk);
                //console.log(chunk.from + ': ' + chunk.trans_result[0].src + ' => ' + chunk.to + ': ' + chunk.trans_result[0].dst);
                console.log(chunk);
        });
});

req.end();
