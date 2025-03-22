//
//  334-IncreasingTripletSubsequence.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 3/22/25.
//

import Foundation

struct IncreasingTripletSubsequence {
    
    /**
     * 시간 복잡도
        * O(n)
     
     ## Example 1.
     Input: nums = [1,2,3,4,5]
     Output: true
     Explanation: Any triplet where i < j < k is valid.

     ## Example 2.
     Input: nums = [5,4,3,2,1]
     Output: false
     Explanation: No triplet exists.
     
     ## Example 3.
     Input: nums = [2,1,5,0,4,6]
     Output: true
     Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.
     */
    static func solution(_ nums: [Int]) -> Bool {
        var first = Int.max
        var second = Int.max
        
        for num in nums {
            if num <= first {
                first = num
            } else if num <= second {
                second = num
            } else {
                return true
            }
        }
        return false
    }
    
}
