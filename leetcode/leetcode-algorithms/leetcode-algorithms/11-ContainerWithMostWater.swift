//
//  11-ContainerWithMostWater.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/22/25.
//

import Foundation

struct ContainerWithMostWater {
    
    /**
     * 시간 복잡도
        * O(n)
     
     ## Example 1.
     Input: height = [1,8,6,2,5,4,8,3,7]
     Output: 49
     Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

     ## Example 2.
     Input: height = [1,1]
     Output: 1
     */
    static func solution(_ height: [Int]) -> Int {
        var n = height.count
        var leftIndex = 0
        var rightIndex = n - 1
        var maxArea: Int = 0

        while leftIndex < rightIndex {
            let widthForArea = rightIndex - leftIndex
            let heightForArea = min(height[leftIndex], height[rightIndex])
            let area = widthForArea * heightForArea
            if area > maxArea { maxArea = area }

            if height[leftIndex] > height[rightIndex] {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }
        return maxArea
    }
    
}
