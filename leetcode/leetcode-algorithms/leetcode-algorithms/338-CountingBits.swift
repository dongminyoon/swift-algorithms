//
//  338-CountingBits.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/1/25.
//

import Foundation

struct CountingBits {
    
    /**
     ## Example 1.
     Input: n = 2
     Output: [0,1,1]
     Explanation:
     0 --> 0
     1 --> 1
     2 --> 10

     ## Example 2.
     Input: n = 5
     Output: [0,1,1,2,1,2]
     Explanation:
     0 --> 0
     1 --> 1
     2 --> 10
     3 --> 11
     4 --> 100
     5 --> 101
     */
    static func solution(_ n: Int) -> [Int]  {
        var result = [Int]()

        for index in 0..<n+1 {
            let binary = self.makeBinaryFromDecimal(index)
            let countOfOne = binary.filter({ $0 == 1 }).count
            result.append(countOfOne)
        }
        return result
    }
    
    static func makeBinaryFromDecimal(_ decimalNumber: Int) -> [Int] {
        if decimalNumber == 0 {
            return [0]
        }

        var stack = [Int]()
        var restNumber = decimalNumber
        
        while restNumber != 0 {
            let remainder = restNumber % 2
            let result = restNumber / 2
            stack.append(remainder)
            
            restNumber = result
        }
        return stack.reversed()
    }
    
}
