//
//  283-MoveZeroes.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/9/25.
//

import Foundation

struct MoveZeroes {
    
    /**
     ## Example 1.
     Input: nums = [0,1,0,3,12]
     Output: [1,3,12,0,0]

     ## Example 2.
     Input: nums = [0]
     Output: [0]
     */
    static func solution(_ nums: inout [Int]) {
        var nonZeroIndex: Int = 0
        for index in 0..<nums.count {
            if nums[index] != 0 {
                nums[nonZeroIndex] = nums[index]
                nonZeroIndex += 1
            }
        }

        for index in nonZeroIndex..<nums.count {
            nums[index] = 0
        }
    }
    
}
