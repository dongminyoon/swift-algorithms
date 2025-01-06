//
//  17-LetterCombinationsOfPhoneNumber.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/6/25.
//

import Foundation

struct LetterCombinationsOfPhoneNumber {
    
    /**
     ## Example 1.
     Input: digits = "23"
     Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

     ## Example 2.
     Input: digits = ""
     Output: []

     ## Example 3.
     Input: digits = "2"
     Output: ["a","b","c"]
     */
    static func solution(_ digits: String) -> [String] {
        let map: [Int: [String]] = [
            2: ["a", "b", "c"],
            3: ["d", "e", "f"],
            4: ["g", "h", "i"],
            5: ["j", "k", "l"],
            6: ["m", "n", "o"],
            7: ["p", "q", "r", "s"],
            8: ["t", "u", "v"],
            9: ["w", "x", "y", "z"]
        ]
        
        var allLetters = [[String]]()
        for digit in digits {
            guard let intDigit = Int(String(digit)) else { continue }
            guard let letters = map[intDigit] else { continue }
            allLetters.append(letters)
        }
        return dfs(allLetters: allLetters, visitIndexs: Array(repeating: 0, count: allLetters.count), allCombi: [])
    }
    
    static func dfs(allLetters: [[String]], visitIndexs: [Int], allCombi: [String]) -> [String] {
        var allCombi = allCombi
        var currentCombi = ""
        for index in 0..<visitIndexs.count {
            let visitIndex = visitIndexs[index]
            let letter = allLetters[index][visitIndex]
            currentCombi += letter
        }

        if allCombi.contains(currentCombi) == false && currentCombi.isEmpty == false {
            allCombi.append(currentCombi)
        }

        let lastIndexs = allLetters.map { $0.count - 1 }
        if lastIndexs == visitIndexs { return allCombi }

        var nextVisitIndexs = visitIndexs
        for index in (0..<visitIndexs.count).reversed() {
            if visitIndexs[index] < lastIndexs[index] {
                nextVisitIndexs[index] += 1
                break
            } else {
                nextVisitIndexs[index] = 0
            }
        }
        return dfs(allLetters: allLetters, visitIndexs: nextVisitIndexs, allCombi: allCombi)
    }
    
}
