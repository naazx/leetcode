class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var left = 0 // День покупки
        var maxProfit = 0
        
        for right in 1..<prices.count {
            if prices[left] < prices[right] {
                let currentProfit = prices[right] - prices[left]
                maxProfit = max(maxProfit, currentProfit)
            } else {
                // Знайшли нове дно — вигідніше купувати тут
                left = right
            }
        }
        
        return maxProfit
    }
}
