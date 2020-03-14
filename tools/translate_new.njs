#!/usr/local/bin/node

const client_config = require('./client_config.njs');
const https = require('https');
const urlencode = require('urlencode');
const queryString = require('querystring');
//let query_string = urlencode(process.argv[2]);
let query_string = process.argv[2];
let source_lang = process.argv[3];
let target_lang = process.argv[4];

if (typeof(target_lang) === "undefined") {
    if (source_lang === "zh") {
        target_lang = "en";
    } else {
        target_lang = "zh";
    }
}

let postData = queryString.stringify({
    'key' : client_config.google_translate_apikey,
    'source' : source_lang,
    'target' : target_lang,
    'model' : 'nmt',
    'q' : query_string
});

const options = {
  host: "translation.googleapis.com",
  path: "/language/translate/v2",
  method: 'POST',
  headers : {
     'Content-Type': 'application/x-www-form-urlencoded',
     'Content-Length': postData.length
  }
};

const req = https.request(options, (res) => {
  //console.log(`STATUS: ${res.statusCode}`);
  //console.log(`HEADERS: ${JSON.stringify(res.headers)}`);
  res.setEncoding('utf8');
  res.on('data', (chunk) => {
    var chunk = JSON.parse(chunk);
    chunk.data.translations.forEach((item, index) => {
            console.log(item.translatedText);
    });
    //console.log(chunk.data.translations[0].translatedText);
  });
  res.on('end', () => {
    //console.log('No more data in response.');
  });
});

req.on('error', (e) => {
  console.error(`problem with request: ${e.message}`);
});

// Write data to request body
req.write(postData);
req.end();
