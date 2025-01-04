//
//  1768-MergeStringsAlternately.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/4/25.
//

import Foundation

struct MergeStringsAlternately {
    
    /**
     ## Example 1.
     Input: word1 = "abc", word2 = "pqr"
     Output: "apbqcr"
     Explanation: The merged string will be merged as so:
     word1:  a   b   c
     word2:    p   q   r
     merged: a p b q c r

     ## Example 2.
     Input: word1 = "ab", word2 = "pqrs"
     Output: "apbqrs"
     Explanation: Notice that as word2 is longer, "rs" is appended to the end.
     word1:  a   b
     word2:    p   q   r   s
     merged: a p b q   r   s

     ## Example 3.
     Input: word1 = "abcd", word2 = "pq"
     Output: "apbqcd"
     Explanation: Notice that as word1 is longer, "cd" is appended to the end.
     word1:  a   b   c   d
     word2:    p   q
     merged: a p b q c   d
     */
    static func solution(_ word1: String, _ word2: String) -> String {
        var result = ""
        let biggestCount = word1.count > word2.count ? word1.count : word2.count

        for index in 0..<biggestCount {
            if index < word1.count {
                let word1Index = word1.index(word1.startIndex, offsetBy: index)
                result += String(word1[word1Index])
            }
            if index < word2.count {
                let word2Index = word2.index(word2.startIndex, offsetBy: index)
                result += String(word2[word2Index])
            }
        }
        return result
    }
    
}
