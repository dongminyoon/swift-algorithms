//
//  933-NumberOfRecentCalls.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/5/25.
//

import Foundation

class RecentCounter {

    var requests = [Int]()

    init() {}
    
    /**
     ## Example 1.
     Input
     ["RecentCounter", "ping", "ping", "ping", "ping"]
     [[], [1], [100], [3001], [3002]]
     Output
     [null, 1, 2, 3, 3]

     Explanation
     RecentCounter recentCounter = new RecentCounter();
     recentCounter.ping(1);     // requests = [1], range is [-2999,1], return 1
     recentCounter.ping(100);   // requests = [1, 100], range is [-2900,100], return 2
     recentCounter.ping(3001);  // requests = [1, 100, 3001], range is [1,3001], return 3
     recentCounter.ping(3002);  // requests = [1, 100, 3001, 3002], range is [2,3002], return 3
     */
    func ping(_ t: Int) -> Int {
        self.requests.append(t)
        self.requests.removeAll(where: { (t-3000...t ~= $0) == false })
        return self.requests.count
    }

}
