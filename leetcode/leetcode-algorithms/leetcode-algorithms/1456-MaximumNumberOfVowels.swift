//
//  1456-MaximumNumberOfVowels.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/22/25.
//

import Foundation

struct MaximumNumberOfVowels {
    
    /**
     * 시간 복잡도
        * O(n)
     
     ## Example 1.
     Input: s = "abciiidef", k = 3
     Output: 3
     Explanation: The substring "iii" contains 3 vowel letters.

     ## Example 2.
     Input: s = "aeiou", k = 2
     Output: 2
     Explanation: Any substring of length 2 contains 2 vowels.
     
     ## Example 3.
     Input: s = "leetcode", k = 3
     Output: 2
     Explanation: "lee", "eet" and "ode" contain 2 vowels.
     */
    static func solution(_ s: String, _ k: Int) -> Int {
        var vowelSet: Set<String> = ["a", "e", "i", "o", "u"]
        var result: Int = 0
        let sArray = s.map { String($0) }

        var vowelCount = sArray[0..<k].reduce(0) { result, element in
            if vowelSet.contains(element) {
                return result + 1
            } else {
                return result
            }
        }
        result = vowelCount
        
        for index in k..<sArray.count {
            if vowelSet.contains(sArray[index - k]) {
                vowelCount -= 1
            }
            if vowelSet.contains(sArray[index ]) {
                vowelCount += 1
            }
            result = max(result, vowelCount)
        }
        return result
    }
    
}
