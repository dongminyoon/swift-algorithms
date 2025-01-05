//
//  841-KeysAndRooms.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/5/25.
//

import Foundation

struct KeysAndRooms {
    
    static var visited = [Bool]()
    
    /**
     ## Example 1.
     Input: rooms = [[1],[2],[3],[]]
     Output: true
     Explanation:
     We visit room 0 and pick up key 1.
     We then visit room 1 and pick up key 2.
     We then visit room 2 and pick up key 3.
     We then visit room 3.
     Since we were able to visit every room, we return true.
     
     ## Example 2.
     Input: rooms = [[1,3],[3,0,1],[2],[0]]
     Output: false
     Explanation: We can not enter room number 2 since the only key that unlocks it is in that room.
     */
    static func solution(_ rooms: [[Int]]) -> Bool {
        self.visited = Array(repeating: false, count: rooms.count)
        self.dfs(currentIndex: 0, rooms: rooms)
        return self.visited.contains(where: { $0 == false }) == false
    }
    
    static func dfs(currentIndex: Int, rooms: [[Int]]) {
        visited[currentIndex] = true

        var keys = rooms[currentIndex]
        for key in keys where visited[key] == false {
            dfs(currentIndex: key, rooms: rooms)
        }
    }
    
}
