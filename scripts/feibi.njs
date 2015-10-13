var readline = require('readline');

var rl = readline.createInterface({
input: process.stdin,
output: process.stdout
});

function feibi(n) {
        var result = n;
        if (n > 2) {
                result = feibi(n - 1) + feibi(n - 2);
        } 
        return result;
};

rl.question("input number ", function(number) {
                // TODO: Log the answer in a database
                for (i = 1; i <= number; i++) {
                console.log("number is ", i, " feibi is ", feibi(i));
                }

                rl.close();
                });

