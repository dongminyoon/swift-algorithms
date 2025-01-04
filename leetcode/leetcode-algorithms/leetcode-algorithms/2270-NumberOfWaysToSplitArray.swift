//
//  2270-NumberOfWaysToSplitArray.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/3/25.
//

import Foundation

struct NumberOfWaysToSplitArray {
    
    /**
     ## Example 1.
     Input: nums = [10,4,-8,7]
     Output: 2

     ## Example 2.
     Input: nums = [2,3,1,0]
     Output: 2
     */
    static func solution(_ nums: [Int]) -> Int {
        var result: Int = 0
        
        var leftSum: Int = nums[0..<1].reduce(0, +)
        var rightSum: Int = nums[1..<nums.count].reduce(0, +)
        if leftSum >= rightSum { result += 1 }

        for index in 1..<nums.count - 1 {
            leftSum += nums[index]
            rightSum -= nums[index]
            if leftSum >= rightSum { result += 1 }
        }
        return result
    }

}
