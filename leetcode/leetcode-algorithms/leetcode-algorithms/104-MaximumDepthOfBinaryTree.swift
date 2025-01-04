//
//  104-MaximumDepthOfBinaryTree.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/4/25.
//


import Foundation

struct MaximumDepthOfBinaryTree {
    
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init() { self.val = 0; self.left = nil; self.right = nil; }
        init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    static var depth: Int = 0
    
    /**
     ## Example 1.
     Input: root = [3,9,20,null,null,15,7]
     Output: 3

     ## Example 2.
     Input: root = [1,null,2]
     Output: 2
     */
    static func solution(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        self.dfs(node: root, depth: 0)
        return self.depth
    }
    
    static func dfs(node: TreeNode, depth: Int) {
        var currentDepth = depth + 1
        
        if let leftNode = node.left {
            self.dfs(node: leftNode, depth: currentDepth)
        }
        
        if let rightNode = node.right {
            self.dfs(node: rightNode, depth: currentDepth)
        }
        
        if self.depth < currentDepth {
            self.depth = currentDepth
        }
    }
    
}
