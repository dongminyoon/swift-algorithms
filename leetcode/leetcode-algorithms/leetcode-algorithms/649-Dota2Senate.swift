//
//  649-Dota2Senate.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/27/25.
//

import Foundation

struct Dota2Senate {
    
    /**
     ## Example 1.
     Input: senate = "RD"
     Output: "Radiant"
     Explanation:
     The first senator comes from Radiant and he can just ban the next senator's right in round 1.
     And the second senator can't exercise any rights anymore since his right has been banned.
     And in round 2, the first senator can just announce the victory since he is the only guy in the senate who can vote.
     
     ## Example 2.
     Input: senate = "RDD"
     Output: "Dire"
     Explanation:
     The first senator comes from Radiant and he can just ban the next senator's right in round 1.
     And the second senator can't exercise any rights anymore since his right has been banned.
     And the third senator comes from Dire and he can ban the first senator's right in round 1.
     And in round 2, the third senator can just announce the victory since he is the only guy in the senate who can vote.
     */
    static func solution(_ senate: String) -> String {
        let size = senate.count
        var direQueue = senate.enumerated().compactMap { index, element -> Int? in
            if element == "D" {
                return index
            } else {
                return nil
            }
        }
        var radiantQueue = senate.enumerated().compactMap { index, element -> Int? in
            if element == "R" {
                return index
            } else {
                return nil
            }
        }

        while radiantQueue.isEmpty == false && direQueue.isEmpty == false {
            let radiant = radiantQueue.removeFirst()
            let dire = direQueue.removeFirst()

            if radiant < dire {
                radiantQueue.append(radiant + size)
            } else {
                direQueue.append(dire + size)
            }
        }
        return radiantQueue.isEmpty ? "Dire" : "Radiant"
    }
    
}
