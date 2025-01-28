//
//  1207-UniqueNumberOfOccurrences.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/28/25.
//

import Foundation

struct UniqueNumberOfOccurrences {
    
    /**
     ## Example 1.
     Input: arr = [1,2,2,1,1,3]
     Output: true
     Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.

     ## Example 2.
     Input: arr = [1,2]
     Output: false

     ## Example 3.
     Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
     Output: true
     */
    static func solution(_ arr: [Int]) -> Bool {
        var dictionary = [Int: Int]()
        for element in arr {
            if let value = dictionary[element] {
                dictionary[element] = value + 1
            } else {
                dictionary[element] = 1
            }
        }

        let allValues = dictionary.values
        var valueSet = Set<Int>()
        for (_, value) in dictionary {
            valueSet.insert(value)
        }
        return valueSet.count == allValues.count ? true : false
    }
    
}
