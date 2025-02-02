//
//  2300-SuccessfulPairsOfSpellsAndPotions.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/2/25.
//

import Foundation

struct SuccessfulPairsOfSpellsAndPotions {
    
    /**
     ## Example 1.
     Input: spells = [5,1,3], potions = [1,2,3,4,5], success = 7
     Output: [4,0,3]
     Explanation:
     - 0th spell: 5 * [1,2,3,4,5] = [5,10,15,20,25]. 4 pairs are successful.
     - 1st spell: 1 * [1,2,3,4,5] = [1,2,3,4,5]. 0 pairs are successful.
     - 2nd spell: 3 * [1,2,3,4,5] = [3,6,9,12,15]. 3 pairs are successful.
     Thus, [4,0,3] is returned.
        
     ## Example 2.
     Input: spells = [3,1,2], potions = [8,5,8], success = 16
     Output: [2,0,2]
     Explanation:
     - 0th spell: 3 * [8,5,8] = [24,15,24]. 2 pairs are successful.
     - 1st spell: 1 * [8,5,8] = [8,5,8]. 0 pairs are successful.
     - 2nd spell: 2 * [8,5,8] = [16,10,16]. 2 pairs are successful.
     Thus, [2,0,2] is returned.
     */
    static func solution(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let n = spells.count
        let m = potions.count
        let sortedPotions = potions.sorted(by: <)
        var sameValueRange = [Int: ClosedRange<Int>]()
        var pairs = [Int]()

        (0..<m).forEach { index in
            let key = sortedPotions[index]
            if let range = sameValueRange[key] {
                sameValueRange[key] = range.lowerBound...index
            } else {
                sameValueRange[key] = index...index
            }
        }
        
        for index in 0..<n {
            let spell = spells[index]
            let partitionIndex = self.searchIndex(fromPotions: sortedPotions, spell: spell, success: success)
            let potion = sortedPotions[partitionIndex]

            if potion * spell < success {
                let lowerBound = min((sameValueRange[potion]?.upperBound ?? 0) + 1, m-1)
                let upperBound = m-1
                if lowerBound == m-1 {
                    pairs.append(0)
                } else {
                    pairs.append((lowerBound...upperBound).count)
                }
            } else {
                let lowerBound = (sameValueRange[potion]?.lowerBound ?? 0)
                let upperBound = m-1
                pairs.append((lowerBound...upperBound).count)
            }
        }
        return pairs
    }
    
    static func searchIndex(fromPotions potions: [Int], spell: Int, success: Int) -> Int {
        var left = 0
        var right = potions.count - 1

        while left < right {
            let partition = (left + right) / 2
            let pair = potions[partition] * spell

            if pair > success {
                right = partition - 1
            } else if pair < success {
                left = partition + 1
            } else {
                break
            }
        }
        return (left + right) / 2
    }
    
}
