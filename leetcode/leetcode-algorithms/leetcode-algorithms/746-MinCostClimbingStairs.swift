//
//  746-MinCostClimbingStairs.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/3/25.
//

import Foundation

struct MinCostClimbingStairs {
    
    /**
     ## Example 1.
     - Input: cost = [10,15,20]
     - Output: 15
     - Explanation: You will start at index 1.
     - Pay 15 and climb two steps to reach the top.
     The total cost is 15.

     ## Example 2.
     - Input: cost = [1,100,1,1,1,100,1,1,100,1]
     - Output: 6
     - Explanation: You will start at index 0.
     - Pay 1 and climb two steps to reach index 2.
     - Pay 1 and climb two steps to reach index 4.
     - Pay 1 and climb two steps to reach index 6.
     - Pay 1 and climb one step to reach index 7.
     - Pay 1 and climb two steps to reach index 9.
     - Pay 1 and climb one step to reach the top.
     The total cost is 6.
     */
    static func solution(_ cost: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 0, count: cost.count)
        
        for index in 2..<cost.count {
            let onestepCost = cost[index - 1] + dp[index - 1]
            let twostepCost = cost[index - 2] + dp[index - 2]
            dp[index] = onestepCost < twostepCost ? onestepCost : twostepCost
        }

        let onestepResultCost = dp[cost.count - 1] + cost[cost.count - 1]
        let twostepResultCost = dp[cost.count - 2] + cost[cost.count - 2]
        return onestepResultCost < twostepResultCost ? onestepResultCost : twostepResultCost
    }
    
}
