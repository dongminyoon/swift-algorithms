//
//  547-NumberOfProvinces.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/27/25.
//

import Foundation

struct NumberOfProvinces {
    
    /**
     ## Example 1.
     Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
     Output: 2

     ## Example 2.
     Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
     Output: 3
     */
    static func solution(_ isConnected: [[Int]]) -> Int {
        var n = isConnected.count
        var visited = Array(repeating: false, count: isConnected.count)
        var result: Int = 0

        for index in 0..<n where visited[index] == false {
            result += 1
            var queue = [index]
            while queue.isEmpty == false {
                let element = queue.removeFirst()
            
                for index in 0..<n where index != element {
                    guard isConnected[element][index] == 1 else { continue }
                    guard visited[index] == false else { continue }
                    queue.append(index)
                    visited[index] = true
                }
            }
        }
        return result
    }
    
}
