//
//  872-LeafSimilarTrees.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/13/25.
//

import Foundation

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

struct LeafSimilarTrees {
    
    /**
     ## Example 1.
     Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
     Output: true

     ## Example 2.
     Input: root1 = [1,2,3], root2 = [1,3,2]
     Output: false
     */
    static func solution(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var root1Leafs = [Int]()
        var root2Leafs = [Int]()

        self.dfs(leafs: &root1Leafs, node: root1)
        self.dfs(leafs: &root2Leafs, node: root2)

        return root1Leafs == root2Leafs
    }
    
    static func dfs(leafs: inout [Int], node: TreeNode?) {
        if let node = node,
            node.left == nil && node.right == nil {
            leafs.append(node.val)
            return
        }

        if let left = node?.left {
            self.dfs(leafs: &leafs, node: left)
        }
        if let right = node?.right {
            self.dfs(leafs: &leafs, node: right)
        }
    }
    
}
