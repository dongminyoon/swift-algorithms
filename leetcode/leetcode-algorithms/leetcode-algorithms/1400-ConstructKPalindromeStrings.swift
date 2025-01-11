//
//  1400-ConstructKPalindromeStrings.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/11/25.
//

import Foundation

struct ConstructKPalindromeStrings {
    
    /**
     ## Example 1.
     Input: s = "annabelle", k = 2
     Output: true
     Explanation: You can construct two palindromes using all characters in s.
     Some possible constructions "anna" + "elble", "anbna" + "elle", "anellena" + "b"
     
     ## Example 2.
     Input: s = "leetcode", k = 3
     Output: false
     Explanation: It is impossible to construct 3 palindromes using all the characters of s.

     ## Example 3.
     Input: s = "true", k = 4
     Output: true
     Explanation: The only possible solution is to put each character in a separate string.
     */
    static func solution(_ s: String, _ k: Int) -> Bool {
        var countHash = [Character: Int]()
        for char in s {
            if let count = countHash[char] {
                countHash[char] = count + 1
            } else {
                countHash[char] = 1
            }
        }
        
        let oddHash = countHash.filter { (_, value) in value % 2 != 0 }
        if oddHash.count <= k {
            if k <= s.count {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}
