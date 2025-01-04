//
//  151-ReverseWordsInAString.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/4/25.
//

import Foundation

struct ReverseWordsInAString {
    
    /**
     ## Example 1.
     Input: s = "the sky is blue"
     Output: "blue is sky the"

     ## Example 2.
     Input: s = "  hello world  "
     Output: "world hello"
     Explanation: Your reversed string should not contain leading or trailing spaces.

     ## Example 3.
     Input: s = "a good   example"
     Output: "example good a"
     Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
     */
    static func solution(_ s: String) -> String {
        var wordsList = [String]()
        var currentWord: String = ""
        for char in s {
            if char == " " {
                if currentWord.isEmpty == false {
                    wordsList.append(currentWord)
                    currentWord.removeAll()
                }
            } else {
                currentWord += String(char)
            }
        }

        if currentWord.isEmpty == false {
            wordsList.append(currentWord)
        }
        return wordsList.reversed().joined(separator: " ")
    }
    
}
