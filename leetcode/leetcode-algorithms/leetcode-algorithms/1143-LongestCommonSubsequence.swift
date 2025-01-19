//
//  1143-LongestCommonSubsequence.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/20/25.
//

import Foundation

struct LongestCommonSubsequence {
    
    /**
     ## Example 1.
     Input: text1 = "abcde", text2 = "ace"
     Output: 3
     Explanation: The longest common subsequence is "ace" and its length is 3.
     
     ## Example 2.
     Input: text1 = "abc", text2 = "abc"
     Output: 3
     Explanation: The longest common subsequence is "abc" and its length is 3.

     ## Example 3.
     Input: text1 = "abc", text2 = "def"
     Output: 0
     Explanation: There is no such common subsequence, so the result is 0.
     */
    static func solution(_ text1: String, _ text2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

        var row: Int = 1
        for char1 in text1 {
            var col: Int = 1
            for char2 in text2 {
                if char1 == char2 {
                    dp[row][col] = dp[row-1][col-1] + 1
                } else {
                    dp[row][col] = max(dp[row-1][col], dp[row][col-1])
                }
                col += 1
            }
            row += 1
        }
        return dp[text1.count][text2.count]
    }
    
}
