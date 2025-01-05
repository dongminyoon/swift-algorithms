//
//  1926-NearestExitFromEntranceInMaze.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/5/25.
//

import Foundation

struct NearestExitFromEntranceInMaze {
    
    struct Point {
        let row: Int
        let col: Int
    }
    
    /**
     ## Example 1.
     Input: maze = [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], entrance = [1,2]
     Output: 1
     Explanation: There are 3 exits in this maze at [1,0], [0,2], and [2,3].
     Initially, you are at the entrance cell [1,2].
     - You can reach [1,0] by moving 2 steps left.
     - You can reach [0,2] by moving 1 step up.
     It is impossible to reach [2,3] from the entrance.
     Thus, the nearest exit is [0,2], which is 1 step away.

     ## Example 2.
     Input: maze = [["+","+","+"],[".",".","."],["+","+","+"]], entrance = [1,0]
     Output: 2
     Explanation: There is 1 exit in this maze at [1,2].
     [1,0] does not count as an exit since it is the entrance cell.
     Initially, you are at the entrance cell [1,0].
     - You can reach [1,2] by moving 2 steps right.
     Thus, the nearest exit is [1,2], which is 2 steps away.

     ## Example 3.
     Input: maze = [[".","+"]], entrance = [0,0]
     Output: -1
     Explanation: There are no exits in this maze.
     */
    static func solution(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var visited = [[Bool]]()
        var cost = [[Int]]()

        for row in 0..<maze.count {
            var visitedRow = [Bool]()
            var costRow = [Int]()
            for col in 0..<maze[row].count {
                visitedRow.append(false)
                costRow.append(0)
            }
            visited.append(visitedRow)
            cost.append(costRow)
        }

        var directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        var queue = [Point]()
        visited[entrance[0]][entrance[1]] = true
        queue.append(Point(row: entrance[0], col: entrance[1]))
        while queue.isEmpty == false {
            let current = queue.removeFirst()

            if (current.row == entrance[0] && current.col == entrance[1]) == false {
                if current.row == 0 || current.row == maze.count - 1 { return cost[current.row][current.col] }
                if current.col == 0 || current.col == maze[0].count - 1 { return cost[current.row][current.col] }
            }
            
            for direction in directions {
                let nextRow = current.row + direction[0]
                let nextCol = current.col + direction[1]

                if 0 <= nextRow && nextRow <= maze.count - 1 && 0 <= nextCol && nextCol <= maze[0].count - 1 {
                    if maze[nextRow][nextCol] == "." && visited[nextRow][nextCol] == false {
                        cost[nextRow][nextCol] = cost[current.row][current.col] + 1
                        visited[nextRow][nextCol] = true
                        queue.append(Point(row: nextRow, col: nextCol))
                    }
                }
            }
        }
        return -1
    }
    
}
