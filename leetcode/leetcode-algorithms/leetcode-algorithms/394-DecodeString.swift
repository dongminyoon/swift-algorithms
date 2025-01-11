//
//  394-DecodeString.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/11/25.
//

import Foundation

struct DecodeString {
    
    /**
     ## Example 1.
     Input: s = "3[a]2[bc]"
     Output: "aaabcbc"

     ## Example 2.
     Input: s = "3[a2[c]]"
     Output: "accaccacc"
     
     ## Example 3.
     Input: s = "2[abc]3[cd]ef"
     Output: "abcabccdcdcdef"
     
     ## Example 4.
     Input: s = "10[leetcode]"
     Output: "leetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcode"
     */
    static func solution(_ s: String) -> String {
        var decoded: String = ""
        var partialDecodedStack = [String]()
        var digitStack = [Int]()

        var currentDigit: String = ""
        for char in s {
            if char == "]" {
                let partialPopped = partialDecodedStack.removeLast()
                let digitPopped = digitStack.removeLast()
                let partialDecoded = (0..<digitPopped).reduce("", { current, _ in current + partialPopped })
                if partialDecodedStack.isEmpty {
                    decoded += partialDecoded
                } else {
                    partialDecodedStack[partialDecodedStack.count-1] += partialDecoded
                }
            } else if char == "[" {
                partialDecodedStack.append("")
                digitStack.append(Int(currentDigit)!)
                currentDigit.removeAll()
            } else if Int(String(char)) != nil {
                currentDigit += String(char)
            } else {
                if partialDecodedStack.isEmpty {
                    decoded += String(char)
                } else {
                    partialDecodedStack[partialDecodedStack.count-1] += String(char)
                }
            }
        }
        return decoded
    }
    
}
