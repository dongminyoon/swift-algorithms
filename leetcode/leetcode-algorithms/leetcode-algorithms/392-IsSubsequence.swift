//
//  392-IsSubsequence.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/13/25.
//

import Foundation

struct IsSubsequence {
    
    /**
     ## Example 1.
     Input: s = "abc", t = "ahbgdc"
     Output: true

     ## Example 2.
     Input: s = "axc", t = "ahbgdc"
     Output: false
     */
    static func solution(_ s: String, _ t: String) -> Bool {
        var sIndex: Int = 0

        var sConverted: [String] = s.map { String($0) }
        var tConverted: [String] = t.map { String($0) }
        
        for element in tConverted {
            if sIndex == s.count {
                return true
            }

            if element == sConverted[sIndex] {
                sIndex += 1
                continue
            }
        }
        return sIndex == s.count
    }
    
}
