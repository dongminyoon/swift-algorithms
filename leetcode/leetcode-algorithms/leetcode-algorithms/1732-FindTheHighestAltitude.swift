//
//  1732-FindTheHighestAltitude.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/4/25.
//

import Foundation

struct FindTheHighestAltitude {
    
    /**
     ## Example 1.
     Input: gain = [-5,1,5,0,-7]
     Output: 1
     Explanation: The altitudes are [0,-5,-4,1,1,-6]. The highest is 1.

     ## Example 2.
     Input: gain = [-4,-3,-2,-1,4,3,2]
     Output: 0
     Explanation: The altitudes are [0,-4,-7,-9,-10,-6,-3,-1]. The highest is 0.
     */
    func solution(_ gain: [Int]) -> Int {
        var altitudes: [Int] = [0]
        for index in 0..<gain.count {
            let altitude = altitudes[index] + gain[index]
            altitudes.append(altitude)
        }
        return altitudes.sorted(by: >).first ?? 0
    }
    
}
