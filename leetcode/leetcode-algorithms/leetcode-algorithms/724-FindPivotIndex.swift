//
//  724-FindPivotIndex.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/26/25.
//

import Foundation

struct FindPivotIndex {
    
    /**
     ## Example 1.
     Input: nums = [1,7,3,6,5,6]
     Output: 3
     Explanation:
     The pivot index is 3.
     Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
     Right sum = nums[4] + nums[5] = 5 + 6 = 11
     
     ## Example 2.
     Input: nums = [1,2,3]
     Output: -1
     Explanation:
     There is no index that satisfies the conditions in the problem statement.
     
     ## Example 3.
     Input: nums = [2,1,-1]
     Output: 0
     Explanation:
     The pivot index is 0.
     Left sum = 0 (no elements to the left of index 0)
     Right sum = nums[1] + nums[2] = 1 + -1 = 0
     */
    static func solution(_ nums: [Int]) -> Int {
        var leftSum: Int = 0
        var rightSum: Int = nums.reduce(0, +) - nums[0]
        
        if nums.count == 1 || leftSum == rightSum { return 0 }

        for index in 1..<nums.count {
            leftSum += nums[index-1]
            rightSum -= nums[index]

            if leftSum == rightSum {
                return index
            }
        }
        return -1
    }
    
}
