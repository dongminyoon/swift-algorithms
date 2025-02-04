//
//  88-MergeSortedArray.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 2/5/25.
//

import Foundation

struct MergeSortedArray {
    
    /**
     ## Example 1.
     Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     Output: [1,2,2,3,5,6]
     Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

     ## Example 2.
     Input: nums1 = [1], m = 1, nums2 = [], n = 0
     Output: [1]
     Explanation: The arrays we are merging are [1] and [].
     The result of the merge is [1].

     ## Example 3.
     Input: nums1 = [0], m = 0, nums2 = [1], n = 1
     Output: [1]
     Explanation: The arrays we are merging are [] and [1].
     The result of the merge is [1].
     Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
     */
    static func solution(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = (Array(nums1.prefix(m)) + Array(nums2.prefix(n))).sorted(by: <)
    }
    
}
