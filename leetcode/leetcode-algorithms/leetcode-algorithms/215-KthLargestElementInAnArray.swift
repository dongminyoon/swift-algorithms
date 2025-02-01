//
//  215-KthLargestElementInAnArray.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/1/25.
//

import Foundation

struct KthLargestElementInAnArray {
    
    /**
     * 시간 복잡도
        * 최선의 경우 O(n)
            * 첫번째 Pivot이 찾으려는 K번째 위치인 경우 for문 한번으로 서칭 가능
        * 최악의 경우 O(n^2)
            * 매번 가장 작은 값을 선택하는 경우(or 가장 큰 값)을 피벗으로 선택할때 발생
            * 오름차순의 배열에서 가장 끝에 있는 큰수를 찾는 경우 최악
     
    ## Example 1.
         Input: nums = [3,2,1,5,6,4], k = 2
        Output: 5

    ## Example 2.
        Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
        Output: 4
     */
    static func solution(_ nums: [Int], _ k: Int) -> Int {
        var array = nums
        return self.quickSelect(&array, left: 0, right: array.count-1, goalIndex: k-1)
    }
    
    static func quickSelect(_ array: inout [Int], left: Int, right: Int, goalIndex: Int) -> Int {
        let pivotIndex = self.partition(&array, left: left, right: right)
        if pivotIndex == goalIndex {
            return array[pivotIndex]
        } else if goalIndex < pivotIndex {
            return self.quickSelect(&array, left: left, right: pivotIndex-1, goalIndex: goalIndex)
        } else {
            return self.quickSelect(&array, left: pivotIndex+1, right: right, goalIndex: goalIndex)
        }
    }

    static func partition(_ array: inout [Int], left: Int, right: Int) -> Int {
        let pivot = array[right]
        var i = left

        for j in left..<right {
            guard pivot < array[j] else { continue }
            array.swapAt(i, j)
            i += 1
        }
        array.swapAt(i, right)
        return i
    }
    
}
