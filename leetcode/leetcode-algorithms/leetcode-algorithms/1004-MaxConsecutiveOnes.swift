//
//  1004-MaxConsecutiveOnes.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/23/25.
//

import Foundation

struct MaxConsecutiveOnes {
    
    /**
     * 시간 복잡도
        * O(n)
     
     ## Example 1.
     Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
     Output: 6
     Explanation: [1,1,1,0,0,1,1,1,1,1,1]
     Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

     ## Example 2.
     Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
     Output: 10
     Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
     Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
     */
    static func solution(_ nums: [Int], _ k: Int) -> Int {
        var maximum: Int = 0

        var leftIndex: Int = 0
        var rightIndex: Int = 0
        var zeroCount: Int = 0

        while rightIndex < nums.count {
            if nums[rightIndex] == 0 {
                zeroCount += 1
            }

            while zeroCount > k {
                if nums[leftIndex] == 0 {
                    zeroCount -= 1
                }
                leftIndex += 1
            }
            
            maximum = max(maximum, rightIndex - leftIndex + 1)
            rightIndex += 1
        }
        return maximum
    }
    
}
