//
//  605-CanPlaceFlowers.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/14/25.
//

import Foundation

struct CanPlaceFlowers {
    
    /**
     ## Example 1.
     Input: flowerbed = [1,0,0,0,1], n = 1
     Output: true

     ## Example 2.
     Input: flowerbed = [1,0,0,0,1], n = 2
     Output: false
     */
    static func solution(_ flowerbed: [Int], _ n: Int) -> Bool {
        if flowerbed.count == 1 {
            return (flowerbed[0] == 0 && n <= 1) || (flowerbed[0] == 1 && n <= 0)
        }

        var flowerbed = flowerbed
        var restFlowerCount = n

        for index in 0..<flowerbed.count {
            let preIndex = index - 1
            let postIndex = index + 1

            guard flowerbed[index] == 0 else { continue }

            if index == 0 {
                if flowerbed[postIndex] == 0 {
                    flowerbed[index] = 1
                    restFlowerCount -= 1
                }
                continue
            }

            if index >= flowerbed.count - 1 {
                if flowerbed[preIndex] == 0 {
                    flowerbed[index] = 1
                    restFlowerCount -= 1
                }
                continue
            }

            if flowerbed[preIndex] == 0 && flowerbed[postIndex] == 0 {
                flowerbed[index] = 1
                restFlowerCount -= 1
                continue
            }
        }
        return restFlowerCount <= 0
    }
    
}
