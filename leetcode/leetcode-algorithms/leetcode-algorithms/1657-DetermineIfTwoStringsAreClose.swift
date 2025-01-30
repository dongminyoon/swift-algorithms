//
//  1657-DetermineIfTwoStringsAreClose.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/30/25.
//

import Foundation

struct DetermineIfTwoStringsAreClose {
    
    /**
     ## Example 1.
     Input: word1 = "abc", word2 = "bca"
     Output: true
     Explanation: You can attain word2 from word1 in 2 operations.
     Apply Operation 1: "abc" -> "acb"
     Apply Operation 1: "acb" -> "bca"

     ## Example 2.
     Input: word1 = "a", word2 = "aa"
     Output: false
     Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.
     
     ## Example 3.
     Input: word1 = "cabbba", word2 = "abbccc"
     Output: true
     Explanation: You can attain word2 from word1 in 3 operations.
     Apply Operation 1: "cabbba" -> "caabbb"
     Apply Operation 2: "caabbb" -> "baaccc"
     Apply Operation 2: "baaccc" -> "abbccc"
     */
    static func solution(_ word1: String, _ word2: String) -> Bool {
        var word1Dictionary = [String: Int]()
        var word2Dictionary = [String: Int]()

        for char in word1 { word1Dictionary[String(char), default: 0] += 1 }
        for char in word2 { word2Dictionary[String(char), default: 0] += 1 }

        let keys1 = Set(word1Dictionary.keys)
        let keys2 = Set(word2Dictionary.keys)
        guard keys1.intersection(keys2) == keys1 else { return false }
        
        let sorted1 = word1Dictionary.sorted(by: { $0.value < $1.value })
        let sorted2 = word2Dictionary.sorted(by: { $0.value < $1.value })
        let hashSize = sorted1.count

        guard sorted1.count == sorted2.count else { return false }
        for index in 0..<hashSize {
            guard sorted1[index].value == sorted2[index].value else { return false }
            continue
        }
        return true
    }
    
}
