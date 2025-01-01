//
//  643-MaximumAverageSubarray.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/1/25.
//

import Foundation

struct MaximumAverageSubarray {
    
    /**
     ## Example 1.
     - Input: nums = [1,12,-5,-6,50,3], k = 4
     - Output: 12.75000

     ## Example 2.
     - Input: nums = [5], k = 1
     - Output: 5.00000
     */
    static func solution(_ nums: [Int], _ k: Int) -> Double {
        var window = [Double]()
        for index in 0...nums.count - k {
            let total = nums[index..<index+k].reduce(0, +)
            let average = Double(total) / Double(k)
            window.append(average)
        }
        
        var maximum = window[0]
        for index in 0..<window.count {
            guard window[index] > maximum else { continue }
            maximum = window[index]
        }
        return maximum
    }
    
}
