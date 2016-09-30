

//Definition for singly-linked list.
function ListNode(val) {
    this.val = val;
    this.next = null;
}

ListNode.prototype = {
append : function (listNode) {
             this.next = listNode;
             return this;
         },
};


var f = function (previousValue, currentValue, currentIndex, array) {
            var currentNode = new ListNode(currentValue);
            var previousNode;
            //console.log(previousValue);
            //console.log(currentValue);
            //console.log(previousNode);
            //console.log(currentNode);
            if (previousValue instanceof ListNode)
            {
                previousNode = previousValue;
            }
            else
            {
                previousNode = new ListNode(previousValue);
            }
            currentNode.append(previousNode);
            return currentNode;
        };
var l1 = [1, 2, 3, 5].reduce(f);
var l2 = [2, 4, 6, 8].reduce(f);

/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */

var addTwoNumbers = function(l1, l2) {
    var l1_array, l2_array = [];
    for (var node = l1; node.next != null; node = l1.next)
    {
        l1_array = l1_array.concat(node.val);
    }
    console.log(l1_array);
};

var res = addTwoNumbers(l1, l2);
console.log(res);
