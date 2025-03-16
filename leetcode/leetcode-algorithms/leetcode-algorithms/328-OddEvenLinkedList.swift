//
//  328-OddEvenLinkedList.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 3/17/25.
//

import Foundation

struct OddEvenLinkedList {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init() { self.val = 0; self.next = nil; }
        init(_ val: Int) { self.val = val; self.next = nil; }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    static func solution(_ head: ListNode?) -> ListNode? {
        guard let oddHead = head else { return head }
        guard let evenHead = oddHead.next else { return oddHead }

        var oddNode: ListNode? = oddHead
        var evenNode: ListNode? = evenHead

        while let nextOdd = evenNode?.next {
            oddNode?.next = nextOdd
            oddNode = oddNode?.next
            evenNode?.next = nextOdd.next
            evenNode = evenNode?.next
        }

        oddNode?.next = evenHead
        return oddHead
    }
    
}
