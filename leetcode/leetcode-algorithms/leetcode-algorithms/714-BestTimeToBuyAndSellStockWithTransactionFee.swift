//
//  714-BestTimeToBuyAndSellStockWithTransactionFee.swift
//  leetcode-algorithms
//
//  Created by Dongmin on 1/28/25.
//

import Foundation

struct BestTimeToBuyAndSellStockWithTransactionFee {
    
    /**
     ## Example 1.
     Input: prices = [1,3,2,8,4,9], fee = 2
     Output: 8
     Explanation: The maximum profit can be achieved by:
     - Buying at prices[0] = 1
     - Selling at prices[3] = 8
     - Buying at prices[4] = 4
     - Selling at prices[5] = 9
     The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.

     ## Example 2.
     Input: prices = [1,3,7,5,10,3], fee = 3
     Output: 6
     */
    static func solution(_ prices: [Int], _ fee: Int) -> Int {
        var hold = Array(repeating: 0, count: prices.count) // 주식을 가지고 있을 때 현금
        var cash = Array(repeating: 0, count: prices.count) // 지금 가지고 있는 현금

        if prices.count <= 1 { return 0 }
        
        hold[0] = -prices[0]
        cash[0] = 0

        for index in 1..<prices.count {
            // 현금에서 새롭게 주식을 구매한 경우 & 전날 주식을 그대로 가지고 있는 경우
            hold[index] = max(cash[index-1]-prices[index], hold[index-1])

            // 당일 주식을 판매한 경우 & 전날에도 주식을 가지고 있지 않은 경우
            cash[index] = max(hold[index-1] + prices[index] - fee, cash[index-1])
        }
        return cash[prices.count-1]
    }
    
}
