//
//  1071-GreatestCommonDivisorOfStrings.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/12/25.
//

import Foundation

struct GreatestCommonDivisorOfStrings {
    
    /**
     ## Example 1.
     Input: str1 = "ABCABC", str2 = "ABC"
     Output: "ABC"
     
     ## Example 2.
     Input: str1 = "ABABAB", str2 = "ABAB"
     Output: "AB"

     ## Example 3.
     Input: str1 = "LEET", str2 = "CODE"
     Output: ""
     */
    static func solution(_ str1: String, _ str2: String) -> String {
        if str1 + str2 != str2 + str1 { return "" }

        let str1Count = str1.count
        let str2Count = str2.count

        var divisor1 = Set<Int>()
        for divisor in 1...str1Count {
            if str1Count % divisor == 0 { divisor1.insert(divisor) }
        }
        var divisor2 = Set<Int>()
        for divisor in 1...str2Count {
            if str2Count % divisor == 0 { divisor2.insert(divisor) }
        }

        let greatestCommonDivisor = divisor1.intersection(divisor2).max() ?? 1
        return String(str1.prefix(greatestCommonDivisor))
    }

    static func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    
}
