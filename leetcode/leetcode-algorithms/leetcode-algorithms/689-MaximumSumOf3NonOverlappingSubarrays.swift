//
//  689-MaximumSumOf3NonOverlappingSubarrays.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/1/25.
//

import Foundation

struct MaximumSumOf3NonOverlappingSubarrays {
    
    /**
     ## Example 1.
     - Input: nums = [1,2,1,2,6,7,5,1], k = 2
     - Output: [0,3,5]

     ## Example 2.
     - Input: nums = [1,2,1,2,1,2,1,2,1], k = 2
     - Output: [0,2,4]
     */
    static func solution(_ nums: [Int], _ k: Int) -> [Int] {
        var windowSum = [Int]()
        for index in 0..<nums.count {
            guard (nums.count - 1) >= (index + k - 1) else { continue }
            windowSum.append(nums[index..<index+k].reduce(0, +))
        }

        var left: [Int] = [0]
        var maxLeft = windowSum[0]
        for index in 1..<windowSum.count {
            if maxLeft < windowSum[index] {
                maxLeft = windowSum[index]
                left.append(index)
            } else {
                left.append(left[index-1])
            }
        }

        var right: [Int] = windowSum.map { _ in 0 }
        var maxRight = windowSum[windowSum.count - 1]
        for index in (0..<windowSum.count).reversed() {
            if maxRight <= windowSum[index] {
                maxRight = windowSum[index]
                right[index] = index
            } else {
                right[index] = right[index + 1]
            }
        }

        var result = [Int]()
        var totalSum = 0
        for mid in k..<(windowSum.count - k) {
            let leftMaxIndex = left[mid - k]
            let rightMaxIndex = right[mid + k]

            let currentSum = windowSum[leftMaxIndex] + windowSum[mid] + windowSum[rightMaxIndex]
            if totalSum < currentSum {
                totalSum = currentSum
                result = [leftMaxIndex, mid, rightMaxIndex]
            }
        }
        return result
    }
    
}
