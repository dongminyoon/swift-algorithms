//
//  206-ReverseLinkedList.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 3/17/25.
//

import Foundation

struct ReverseLinkedList {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init() { self.val = 0; self.next = nil; }
        init(_ val: Int) { self.val = val; self.next = nil; }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    /**
     * 시간 복잡도
        * O(n)
     
     ## Example 1.
     Input: head = [1,2,3,4,5]
     Output: [5,4,3,2,1]

     ## Example 2.
     Input: head = [1,2]
     Output: [2,1]
     */
    static func solution(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current: ListNode? = head

        while current != nil {
            let nextNode = current?.next
            current?.next = prev
            prev = current
            current = nextNode
        }
        return prev
    }
    
}
