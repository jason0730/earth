var nums = [-1,-2,-3,-4,-5]
var target = -8;

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    var newNums = [].concat(nums);
    newNums.sort(function (a, b) {
        return a - b;
    });
    var final_result;
    for (var n_i in newNums)
    {
        var result = [newNums[n_i]];
        var secondTarget = target - newNums[n_i];
        var secondNums = [].concat(newNums);
        delete secondNums[n_i];
        for (var k_i in secondNums)
        {
            if (secondTarget == secondNums[k_i])
            {
                result = result.concat(secondNums[k_i]);
                break;
            }
        }
        if (result.length == 2)
        {
            final_result = result;
            break;
        }
    }
    var res = [];
    for (var n_i in nums)
    {
        for (var k_i in final_result)
        {
            if (nums[n_i] == final_result[k_i])
            {
                res = res.concat(parseInt(n_i));
                break;
            }
        }
        if (res.length == final_result.length)
            break;
    }
    return res;
};

result = twoSum(nums, target);
console.log(result);
