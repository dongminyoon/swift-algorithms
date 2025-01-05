//
//  199-BinaryTreeRightSideView.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/5/25.
//

import Foundation

struct BinaryTreeRightSideView {
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    /**
     ## Example 1.
     Input: root = [1,2,3,null,5,null,4]
     Output: [1,3,4]
     
     ## Example 2.
     Input: root = [1,2,3,4,null,null,null,5]
     Output: [1,3,4,5]

     ## Example 3.
     Input: root = [1,null,3]
     Output: [1,3]

     ## Example 4.
     Input: root = []
     Output: []
     */
    static func solution(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var results = [Int]()
        var queue = [root]

        while queue.isEmpty == false {
            var currentSize = queue.count
            for index in 0..<currentSize {
                let node = queue.removeFirst()
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }

                if index == currentSize - 1 { results.append(node.val) }
            }
        }
        return results
    }
    
}
