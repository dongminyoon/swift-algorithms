//
//  916-WordSubsets.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/11/25.
//

import Foundation

struct WordSubsets {
    
    /**
     ## Example 1.
     Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["e","o"]
     Output: ["facebook","google","leetcode"]

     ## Example 2.
     Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["l","e"]
     Output: ["apple","google","leetcode"]
     */
    static func solution(_ words1: [String], _ words2: [String]) -> [String] {
        var words2Dictionary = [Character: Int]()
        for words in words2 {
            var tempDictionary = [Character: Int]()
            for char in words {
                if let count = tempDictionary[char] {
                    tempDictionary[char] = count + 1
                } else {
                    tempDictionary[char] = 1
                }
            }

            for (key, value) in tempDictionary {
                words2Dictionary[key] = max(value, words2Dictionary[key] ?? 0)
            }
        }

        return words1.filter { words in
            var dictionary = [Character: Int]()
            for char in words {
                if let count = dictionary[char] {
                    dictionary[char] = count + 1
                } else {
                    dictionary[char] = 1
                }
            }

            for (key, value) in words2Dictionary {
                if (dictionary[key] ?? 0) < value {
                    return false
                }
            }
            return true
        }
    }
    
}
