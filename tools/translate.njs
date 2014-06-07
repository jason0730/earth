#!/usr/local/bin/node


var http = require('http');
queryString = process.argv[2];
var req = http.get("http://openapi.baidu.com/public/2.0/bmt/translate?client_id=&from=auto&to=auto&q=" + queryString, function(res) {
        //console.log('STATUS: ' + res.statusCode);
        //console.log('HEADERS: ' + JSON.stringify(res.headers));
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
                var chunk = JSON.parse(chunk);
                console.log(chunk.from + ': ' + chunk.trans_result[0].src + ' => ' + chunk.to + ': ' + chunk.trans_result[0].dst);
        });
});

req.end();

# 1
