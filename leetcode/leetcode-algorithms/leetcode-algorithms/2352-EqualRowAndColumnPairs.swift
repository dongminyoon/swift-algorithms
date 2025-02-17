//
//  2352-EqualRowAndColumnParis.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/18/25.
//

import Foundation

struct EqualRowAndColumnParis {
    
    /**
     * 시간 복잡도
        * O(n^2)
     
     ## Example 1.
     Input: grid = [[3,2,1],[1,7,6],[2,7,7]]
     Output: 1
     Explanation: There is 1 equal row and column pair:
     - (Row 2, Column 1): [2,7,7]

     ## Example 2.
     Input: grid = [[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]
     Output: 3
     Explanation: There are 3 equal row and column pairs:
     - (Row 0, Column 0): [3,1,2,2]
     - (Row 2, Column 2): [2,4,2,2]
     - (Row 3, Column 2): [2,4,2,2]
     */
    static func solution(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var rowTable = Dictionary(uniqueKeysWithValues: grid.enumerated().map({ index, array in (index, array) }))
        var columnTable = Dictionary(uniqueKeysWithValues: (0..<n).map { index in (index, (0..<n).map { grid[$0][index] }) })

        var result: Int = 0
        for row in 0..<n {
            for column in 0..<n {
                guard rowTable[row] == columnTable[column] else { continue }
                result += 1
            }
        }
        return result
    }
    
}
