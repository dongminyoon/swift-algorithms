//
//  1431-KidsWithTheGreatestNumberOfCandies.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/13/25.
//

import Foundation

struct KidsWithTheGreatestNumberOfCandies {
    
    /**
     ## Example 1.
     Input: candies = [2,3,5,1,3], extraCandies = 3
     Output: [true,true,true,false,true]
     Explanation: If you give all extraCandies to:
     - Kid 1, they will have 2 + 3 = 5 candies, which is the greatest among the kids.
     - Kid 2, they will have 3 + 3 = 6 candies, which is the greatest among the kids.
     - Kid 3, they will have 5 + 3 = 8 candies, which is the greatest among the kids.
     - Kid 4, they will have 1 + 3 = 4 candies, which is not the greatest among the kids.
     - Kid 5, they will have 3 + 3 = 6 candies, which is the greatest among the kids.

     ## Example 2.
     Input: candies = [4,2,1,1,2], extraCandies = 1
     Output: [true,false,false,false,false]
     Explanation: There is only 1 extra candy.
     Kid 1 will always have the greatest number of candies, even if a different kid is given the extra candy.
     */
    static func solution(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var result = Array(repeating: false, count: candies.count)
        guard let maxCandies = candies.max() else { return result }

        for index in 0..<candies.count {
            result[index] = candies[index] + extraCandies >= maxCandies
        }
        return result
    }
    
}
