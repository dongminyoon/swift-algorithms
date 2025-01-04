//
//  1930-UniqueLengthPalindromicSubsequences.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/4/25.
//

import Foundation

struct UniqueLengthPalindromicSubsequences {
    
    /**
     ## Example 1.
     Input: s = "aabca"
     Output: 3
     Explanation: The 3 palindromic subsequences of length 3 are:
     - "aba" (subsequence of "aabca")
     - "aaa" (subsequence of "aabca")
     - "aca" (subsequence of "aabca")

     ## Example 2.
     Input: s = "adc"
     Output: 0
     Explanation: There are no palindromic subsequences of length 3 in "adc".
     
     ## Example 3.
     Input: s = "bbcbaba"
     Output: 4
     Explanation: The 4 palindromic subsequences of length 3 are:
     - "bbb" (subsequence of "bbcbaba")
     - "bcb" (subsequence of "bbcbaba")
     - "bab" (subsequence of "bbcbaba")
     - "aba" (subsequence of "bbcbaba")
     */
    static func solution(_ s: String) -> Int {
        let aASCIIValue = Int(Character("a").asciiValue ?? 0)
        let zASCIIValue = Int(Character("z").asciiValue ?? 0)

        var subsequenceSet = Set<String>()
        var charCountArray = Array(repeating: 0, count: zASCIIValue - aASCIIValue + 1)
        for char in s {
            let charASCIIValue = Int(char.asciiValue ?? 0)
            let index = charASCIIValue - aASCIIValue
            charCountArray[index] += 1
        }

        var leftSideSet = Set<Character>()
        for char in s {
            let charASCIIValue = Int(char.asciiValue ?? 0)
            let index = charASCIIValue - aASCIIValue
            charCountArray[index] -= 1
            
            for index in 0..<charCountArray.count where charCountArray[index] > 0 {
                guard let unicodeScalar = UnicodeScalar(aASCIIValue + index) else { continue }
                let rightChar = Character(unicodeScalar)
                
                guard leftSideSet.contains(rightChar) else { continue }
                subsequenceSet.insert("\(rightChar)\(char)\(rightChar)")
            }
            leftSideSet.insert(char)
        }
        return subsequenceSet.count
    }
    
}
