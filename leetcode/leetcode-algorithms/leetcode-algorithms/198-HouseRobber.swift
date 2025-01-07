//
//  198-HouseRobber.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/7/25.
//

import Foundation

struct HouseRobber {
    
    /**
     ## Example 1.
     Input: nums = [1,2,3,1]
     Output: 4
     Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
     Total amount you can rob = 1 + 3 = 4.

     ## Example 2.
     Input: nums = [2,7,9,3,1]
     Output: 12
     Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
     Total amount you can rob = 2 + 9 + 1 = 12.
     */
    static func solution(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        
        guard nums.count > 1 else { return dp[0] }
        dp[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
        return dp[nums.count-1]
    }
    
}
