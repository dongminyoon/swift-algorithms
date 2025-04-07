//
//  443-StringsCompression.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 4/7/25.
//

import Foundation

struct StringCompression {
    /**

    ## Example 1.
     Input: chars = ["a","a","b","b","c","c","c"]
     Output: Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
     Explanation: The groups are "aa", "bb", and "ccc". This compresses to "a2b2c3".

    ## Example 2.
     Input: chars = ["a"]
     Output: Return 1, and the first character of the input array should be: ["a"]
     Explanation: The only group is "a", which remains uncompressed since it's a single character.

    ## Example 3.
     Input: chars = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
     Output: Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].
     Explanation: The groups are "a" and "bbbbbbbbbbbb". This compresses to "ab12".
     */
    static func solution(_ chars: inout [Character]) -> Int {
        var result = [Character]()
        var currentChar: Character?
        var currentCharCount: Int = 0

        for index in 0..<chars.count {
            if currentChar == chars[index] || currentChar == nil {
                // 현재 Character와 같은 경우
                currentChar = chars[index]
                currentCharCount += 1
            } else {
                // 현재 Character와 다른 경우
                if let resultChar = currentChar {
                    result.append(resultChar)
                    
                    if currentCharCount > 1 {
                        "\(currentCharCount)".forEach { result.append($0) }
                    }
                }

                currentChar = chars[index]
                currentCharCount = 1
            }
        }

        if let resultChar = currentChar {
            result.append(resultChar)

            if currentCharCount > 1 {
                "\(currentCharCount)".forEach { result.append($0) }
            }
        }

        chars = result
        return chars.count
    }
    
}
