//
//  2095-DeleteTheMiddleNodeOfLinkedList.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/5/25.
//

import Foundation

struct DeleteTheMiddleNodeOfLinkedList {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    /**
     ## Example 1.
     Input: head = [1,3,4,7,1,2,6]
     Output: [1,3,4,1,2,6]
     Explanation:
     The above figure represents the given linked list. The indices of the nodes are written below.
     Since n = 7, node 3 with value 7 is the middle node, which is marked in red.
     We return the new list after removing this node.

     ## Example 2.
     Input: head = [1,2,3,4]
     Output: [1,2,4]
     Explanation:
     The above figure represents the given linked list.
     For n = 4, node 2 with value 3 is the middle node, which is marked in red.
     
     ## Example 3.
     Input: head = [2,1]
     Output: [2]
     Explanation:
     The above figure represents the given linked list.
     For n = 2, node 1 with value 1 is the middle node, which is marked in red.
     Node 0 with value 2 is the only node remaining after removing node 1.
     */
    static func solution(_ head: ListNode?) -> ListNode? {
        var length: Int = 0
        var tempNode: ListNode? = head
        while tempNode != nil {
            length += 1
            tempNode = tempNode?.next
        }

        if length == 1 { return nil }

        var index: Int = 0
        var currentNode: ListNode? = head
        while currentNode != nil {
            if index == (length / 2) - 1 {
                let deletedNode = currentNode?.next
                currentNode?.next = deletedNode?.next
            }
            currentNode = currentNode?.next
            index += 1
        }
        return head
    }
    
}
