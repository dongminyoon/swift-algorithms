//
//  72-EditDistance.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/30/25.
//

import Foundation

struct EditDistance {
    
    /**
     ## Example 1.
     Input: word1 = "horse", word2 = "ros"
     Output: 3
     Explanation:
     horse -> rorse (replace 'h' with 'r')
     rorse -> rose (remove 'r')
     rose -> ros (remove 'e')

     ## Example 2.
     Input: word1 = "intention", word2 = "execution"
     Output: 5
     Explanation:
     intention -> inention (remove 't')
     inention -> enention (replace 'i' with 'e')
     enention -> exention (replace 'n' with 'x')
     exention -> exection (replace 'n' with 'c')
     exection -> execution (insert 'u')
     */
    static func solution(_ word1: String, _ word2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)

        (0...word1.count).forEach { dp[$0][0] = $0 }
        (0...word2.count).forEach { dp[0][$0] = $0 }

        if word1.count == 0 { return dp[0][word2.count] }
        if word2.count == 0 { return dp[word1.count][0] }

        for row in 1...word1.count {
            let word1Index = word1.index(word1.startIndex, offsetBy: row-1)
            for col in 1...word2.count  {
                let word2Index = word2.index(word2.startIndex, offsetBy: col-1)

                if word1[word1Index] == word2[word2Index] {
                    dp[row][col] = dp[row-1][col-1]
                } else {
                    dp[row][col] = min(min(dp[row][col-1], dp[row-1][col]), dp[row-1][col-1]) + 1
                }
            }
        }
        return dp[word1.count][word2.count]
    }
    
}
