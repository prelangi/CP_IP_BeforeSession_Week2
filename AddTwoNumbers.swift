/*
Add Two Numbers as ListsBookmark Suggest Edit
You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

    342 + 465 = 807
Make sure there are no trailing zeros in the output list
So, 7 -> 0 -> 8 -> 0 is not a valid response even though the value is still 807.
*/

import Foundation

/**
 * Definition for a linked list node
 *
 * class ListNode {
 *    var val: Int = 0
 *    var next: ListNode?
 * }
 *
 */

class Solution {
	func addTwoNumbers(_ A: ListNode?, _ B: ListNode?) -> ListNode? {

	    var A1 = A
	    var B1 = B
        var sum = 0, carry = 0
        var result = ListNode()
        var head = result
        var prevNode = result
        var nextNode = ListNode()
        
        while(A1 != nil && B1 != nil) {
            sum = A1!.val + B1!.val + carry 
            if(sum>=10) {
                carry = 1
                sum = sum%10
            }
            else {
                carry = 0
            }
            nextNode = ListNode()
            result.val = sum
            result.next = nextNode
            prevNode = result
            result = nextNode
            A1 = A1!.next
            B1 = B1!.next
        }
        
        while (A1 != nil) {
            sum = carry + A1!.val 
            if(sum>=10) {
                carry = 1
                sum = sum%10
            }
            else {
                carry = 0
            }
            nextNode = ListNode()
            result.val = sum
            prevNode = result
            result.next = nextNode
            result = nextNode
            A1 = A1!.next
        }
        
        while (B1 != nil) {
            sum = carry + B1!.val 
            if(sum>=10) {
                carry = 1
                sum = sum%10
            }
            else {
                carry = 0
            }
            nextNode = ListNode()
            result.val = sum
            prevNode = result
            result.next = nextNode
            result = nextNode
            B1 = B1!.next
        }
        
        
        if carry>0 {
            result.val = carry
        }
        else {
            prevNode.next = nil
        }
        
        return head
	}
}
