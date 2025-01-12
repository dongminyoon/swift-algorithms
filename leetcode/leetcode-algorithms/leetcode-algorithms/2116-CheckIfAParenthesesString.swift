//
//  2116-CheckIfAParenthesesString.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/12/25.
//

import Foundation

struct CheckIfAParenthesesString {
    
    /**
     ## Example 1.
     Input: s = "))()))", locked = "010100"
     Output: true
     Explanation: locked[1] == '1' and locked[3] == '1', so we cannot change s[1] or s[3].
     We change s[0] and s[4] to '(' while leaving s[2] and s[5] unchanged to make s valid.
     
     ## Example 2.
     Input: s = "()()", locked = "0000"
     Output: true
     Explanation: We do not need to make any changes because s is already valid.

     ## Example 3.
     Input: s = ")", locked = "0"
     Output: false
     Explanation: locked permits us to change s[0].
     Changing s[0] to either '(' or ')' will not make s valid.
     */
    static func solution(_ s: String, _ locked: String) -> Bool {
        if s.count % 2 != 0 { return false }

        var openBracketStack = [Int]()
        var unlockedStack = [Int]()
        var index = 0

        for (lock, char) in zip(locked, s) {
            if lock == "0" {
                unlockedStack.append(index)
            } else if char == "(" {
                openBracketStack.append(index)
            } else {
                if openBracketStack.isEmpty == false {
                    openBracketStack.removeLast()
                } else if unlockedStack.isEmpty == false {
                    unlockedStack.removeLast()
                } else {
                    return false
                }
            }

            index += 1
        }

        while openBracketStack.isEmpty == false && unlockedStack.isEmpty == false {
            let openBracketIndex = openBracketStack.removeLast()
            let unlockedIndex = unlockedStack.removeLast()

            if openBracketIndex > unlockedIndex {
                return false
            }
        }

        if openBracketStack.isEmpty {
            return true
        } else {
            return false
        }
    }
    
}
