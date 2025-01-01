//
//  1137-NthTribonacciNumber.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/1/25.
//

import Foundation

struct NthTribonacciNumber {
    
    /**
     ## Example 1.
     - Input: n = 4
     - Output: 4

     ## Example 2.
     - Input: n = 25
     - Output: 1389537
     */
    static func solution(_ n: Int) -> Int {
        var tribo = Array(repeating: 0, count: 38)
        tribo[0] = 0
        tribo[1] = 1
        tribo[2] = 1

        if n >= 3 {
            for index in 3...n {
                tribo[index] = tribo[index-3] + tribo[index-2] + tribo[index-1]
            }
        }
        return tribo[n]
    }
    
}
