//
//  main.c
//  leetcode_c
//
//  Created by 权政龙 on 30/08/2017.
//  Copyright © 2017 权政龙. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    return l1;
}

struct ListNode* makeListNode(int numbers[], int length) {
    struct ListNode* ln = NULL;
    struct ListNode* lnNext = NULL;
    struct ListNode* tmp;
    for (int i = 0; i < length; i++)
    {
        tmp = malloc(sizeof(tmp));
        tmp->val = numbers[i];
        tmp->next = NULL;
        if (ln == NULL)
        {
            ln = tmp;
            lnNext = ln->next;
        }
        else if (lnNext == NULL)
        {
            lnNext = tmp;
            lnNext = tmp->next;
        }
        else
        {
        }
        free(tmp);
    }
    return ln;
}

int main(int argc, const char * argv[]) {
    int length;
    struct ListNode* l1 = NULL;
    int l1_list[] = {2, 4, 3};
    length = sizeof(l1_list)/sizeof(l1_list[0]);
    l1 = makeListNode(l1_list, length);
    struct ListNode* l2 = NULL;
    int l2_list[] = {5, 6, 4};
    length = sizeof(l2_list)/sizeof(l2_list[0]);
    l2 = makeListNode(l2_list, length);
    
    return 0;
}

