//
//  2336-SmallestNumberInInfiniteSet.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/2/25.
//

import Foundation

/**
 * 시간 복잡도
    * HashMap을 이용하여 O(1)
 
 ## Example 1.
 Input
 ["SmallestInfiniteSet", "addBack", "popSmallest", "popSmallest", "popSmallest", "addBack", "popSmallest", "popSmallest", "popSmallest"]
 [[], [2], [], [], [], [1], [], [], []]
 Output
 [null, null, 1, 2, 3, null, 1, 4, 5]

 Explanation
 SmallestInfiniteSet smallestInfiniteSet = new SmallestInfiniteSet();
 smallestInfiniteSet.addBack(2);    // 2 is already in the set, so no change is made.
 smallestInfiniteSet.popSmallest(); // return 1, since 1 is the smallest number, and remove it from the set.
 smallestInfiniteSet.popSmallest(); // return 2, and remove it from the set.
 smallestInfiniteSet.popSmallest(); // return 3, and remove it from the set.
 smallestInfiniteSet.addBack(1);    // 1 is added back to the set.
 smallestInfiniteSet.popSmallest(); // return 1, since 1 was added back to the set and
                                    // is the smallest number, and remove it from the set.
 smallestInfiniteSet.popSmallest(); // return 4, and remove it from the set.
 smallestInfiniteSet.popSmallest(); // return 5, and remove it from the set.
 */
class SmallestInfiniteSet {
    
    init() {
        self.infiniteSet = Set((1...1000).map({ $0 }))
    }
    
    func popSmallest() -> Int {
        let min = self.infiniteSet.min() ?? 1
        return self.infiniteSet.remove(min) ?? 1
    }
    
    func addBack(_ num: Int) {
        self.infiniteSet.insert(num)
    }

    private var infiniteSet: Set<Int>

    
}
