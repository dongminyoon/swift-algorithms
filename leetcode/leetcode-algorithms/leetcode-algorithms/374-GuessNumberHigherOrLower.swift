//
//  374-GuessNumberHigherOrLower.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/6/25.
//

import Foundation

struct GuessNumberHigherOrLower {
    
    /**
     ## Example 1.
     Input: n = 10, pick = 6
     Output: 6

     ## Example 2.
     Input: n = 1, pick = 1
     Output: 1

     ## Example 3.
     Input: n = 2, pick = 1
     Output: 1
     */
    static func solution(_ n: Int) -> Int {
        var guessNumber = n
        var min = 1
        var max = Int(truncating: NSDecimalNumber(decimal: pow(2, 31) - 1))
        while true {
            let predictResult = guess(guessNumber)
            if predictResult == 0 { return guessNumber }

            if predictResult == 1 {
                min = guessNumber + 1
            } else {
                max = guessNumber - 1
            }
            guessNumber = (min + max) / 2
        }
    }
    
    static func guess(_ num: Int) -> Int {
        return 0
    }
    
}
