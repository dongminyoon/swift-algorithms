//
//  20-ValidParentheses.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/5/25.
//

import Foundation

struct ValidParentheses {
    
    /**
     ## Example 1.
     Input: s = "()"
     Output: true

     ## Example 2.
     Input: s = "()[]{}"
     Output: true
     
     ## Example 3.
     Input: s = "(]"
     Output: false

     ## Example 4.
     Input: s = "([])"
     Output: true
     */
    static func solution(_ s: String) -> Bool {
        var stack = [String]()

        for element in s {
            if element == "(" || element == "[" || element == "{" {
                stack.append(String(element))
            } else {
                guard stack.isEmpty == false else { return false }
                
                let popped = stack.removeLast()

                guard (popped == "(" && element == ")") ||
                      (popped == "[" && element == "]") ||
                      (popped == "{" && element == "}") else {
                    return false
                }
                continue
            }
        }
        return stack.isEmpty
    }
    
}
