//
//  62-UniquePaths.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/6/25.
//

import Foundation

struct UniquePaths {
    
    /**
     ## Example 1.
     Input: m = 3, n = 7
     Output: 28

     ## Example 2.
     Input: m = 3, n = 2
     Output: 3
     Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
     1. Right -> Down -> Down
     2. Down -> Down -> Right
     3. Down -> Right -> Down
     */
    static func solution(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        (0..<m).forEach { i in dp[i][0] = 1 }
        (0..<n).forEach { i in dp[0][i] = 1 }
        
        for row in 1..<m {
            for col in 1..<n {
                dp[row][col] = dp[row-1][col] + dp[row][col-1]
            }
        }
        return dp[m-1][n-1]
    }
    
}
