//
//  735-AsteroidCollision.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/9/25.
//

import Foundation

struct AsteroidCollision {
    
    /**
     ## Example 1.
     Input: asteroids = [5,10,-5]
     Output: [5,10]
     Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.

     ## Example 2.
     Input: asteroids = [8,-8]
     Output: []
     Explanation: The 8 and -8 collide exploding each other.
     
     ## Example 3.
     Input: asteroids = [10,2,-5]
     Output: [10]
     Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.
     */
    static func solution(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()

        for asteroid in asteroids {
            var shouldStack = true

            while stack.isEmpty == false {
                let stackLast = stack.last!
                if (stackLast > 0 && asteroid < 0) {
                    if abs(stackLast) > abs(asteroid) {
                        shouldStack = false
                        break
                    } else if abs(stackLast) == abs(asteroid) {
                        shouldStack = false
                        stack.removeLast()
                        break
                    } else {
                        stack.removeLast()
                    }
                } else {
                    break
                }
            }
            if shouldStack {
                stack.append(asteroid)
            }
        }
        return stack
    }
    
}
