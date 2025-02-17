//
//  345-ReverseVowelsOfAString.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/18/25.
//

import Foundation

struct ReverseVowelsOfAString {
    
    /**
     * 시간 복잡도
        * O(N)
     
     ## Example 1.
     Input: flowerbed = [1,0,0,0,1], n = 1
     Output: true

     ## Example 2.
     Input: flowerbed = [1,0,0,0,1], n = 2
     Output: false
     */
    static func solution(_ s: String) -> String {
        var vowelSet = Set(["a", "e", "i", "o", "u"])
        var vowelIndexes = [Int]()
        for (index, element) in s.enumerated() where vowelSet.contains(String(element).lowercased()) {
            vowelIndexes.append(index)
        }

        var sArray = s.map { String($0) }
        for index in 0..<(vowelIndexes.count / 2) {
            let a = vowelIndexes[index]
            let b = vowelIndexes[vowelIndexes.count - 1 - index]
            sArray.swapAt(a, b)
        }
        return sArray.reduce("", { $0 + $1 })
    }
    
}
