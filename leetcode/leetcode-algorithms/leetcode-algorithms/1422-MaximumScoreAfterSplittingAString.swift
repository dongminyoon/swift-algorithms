//
//  1422-MaximumScoreAfterSplittingAString.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/1/25.
//

import Foundation

struct MaximumScoreAfterSplittingAString {
    
    /**
     ## Example 1.
     Input: s = "011101"
     Output: 5

     ## Example 2.
     Input: s = "00111"
     Output: 5
     */
    static func solution(_ s: String) -> Int {
        var max: Int = 0
        for index in (1..<s.count) {
            let splitIndex = s.index(s.startIndex, offsetBy: index)
            let leftSubString = s[s.startIndex..<splitIndex]
            let rightSubString = s[splitIndex..<s.endIndex]
            
            let leftTotal = leftSubString.reduce(0, { result, character in
                return result + (character == "0" ? 1 : 0)
            })
            let rightTotal = rightSubString.reduce(0, { result, character in
                return result + (character == "1" ? 1 : 0)
            })

            if leftTotal + rightTotal > max {
                max = leftTotal + rightTotal
            }
        }
        return max
    }
    
}
