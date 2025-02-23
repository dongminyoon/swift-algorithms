//
//  238-ProductOfArrayExceptSelf.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/23/25.
//

import Foundation

struct ProductOfArrayExceptSelf {
    
    /**
     * 시간 복잡도
        * O(n)
     
     ## Example 1.
     Input: nums = [1,2,3,4]
     Output: [24,12,8,6]

     ## Example 2.
     Input: nums = [-1,1,0,-3,3]
     Output: [0,0,9,0,0]
     */
    static func solution(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: nums.count)

        var leftProduct: Int = 1
        for index in 0..<nums.count {
            result[index] = leftProduct
            leftProduct *= nums[index]
        }

        var rightProduct: Int = 1
        for index in (0..<nums.count).reversed() {
            result[index] *= rightProduct
            rightProduct *= nums[index]
        }
        return result
    }
    
}
