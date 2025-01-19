//
//  216-CombinationSum3.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/20/25.
//

import Foundation

struct CombinationSum3 {
    
    static var result = Set<[Int]>()
    
    /**
     ## Example 1.
     Input: k = 3, n = 7
     Output: [[1,2,4]]
     Explanation:
     1 + 2 + 4 = 7
     There are no other valid combinations.
     
     ## Example 2.
     Input: k = 3, n = 9
     Output: [[1,2,6],[1,3,5],[2,3,4]]
     Explanation:
     1 + 2 + 6 = 9
     1 + 3 + 5 = 9
     2 + 3 + 4 = 9
     There are no other valid combinations.

     ## Example 3.
     Input: k = 4, n = 1
     Output: []
     Explanation: There are no valid combinations.
     Using 4 different numbers in the range [1,9], the smallest sum we can get is 1+2+3+4 = 10 and since 10 > 1, there are no valid combination.
     */
    static func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        self.findCombination([], canUseCount: k, goal: n)
        return Array(self.result)
    }

    static func findCombination(_ currentState: [Int], canUseCount: Int, goal: Int) {
        // 정답 찾은 경우
        var currentState = currentState.sorted(by: <)
        if currentState.reduce(0, +) == goal && currentState.count == canUseCount {
            self.result.insert(currentState)
            return
        }
        
        // 사용 가능한 숫자 초과한 경우
        if currentState.count > canUseCount {
            return
        }

        let availableNumbers = (1...9)
        for number in availableNumbers {
            guard currentState.contains(number) == false else { continue }
            self.findCombination(currentState + [number], canUseCount: canUseCount, goal: goal)
        }
    }
    
}
