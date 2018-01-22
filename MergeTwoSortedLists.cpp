/*
Merge two sorted linked lists and return it as a new list. 
The new list should be made by splicing together the nodes of the first two lists, and should also be sorted.

For example, given following linked lists :

  5 -> 8 -> 20 
  4 -> 11 -> 15
The merged list should be :

4 -> 5 -> 8 -> 11 -> 15 -> 20
*/


/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
ListNode* Solution::mergeTwoLists(ListNode* A, ListNode* B) {
    
    if (A==NULL && B==NULL) {
        return NULL;
    }
    else if (A==NULL) {
        return B;
    }
    else if (B==NULL) {
        return A;
    }
    
    ListNode *currhead = NULL;
    ListNode *currtail = NULL;
    
    while(A && B) {
        if (A->val < B->val) {
            //cout << "A before B" << endl;
            if(!currhead) {
                //cout << "Assigning currhead to A" << endl;
                currhead = A;
            }
            else {
                currtail->next = A;
            }
            currtail = A;
            A = A->next;
        }
        else {
            //cout << "B before A" << endl;
            if(!currhead) {
                //cout << "Assigning currhead to B" << endl;
                currhead = B;
            }
            else {
                currtail->next = B;
            }
            currtail = B;
            B = B->next;
        }
    }
    
    if(A != NULL) {
        currtail->next = A;
    }
    
    if(B != NULL) {
        currtail->next = B;
    }
    
    return currhead;
    
}
