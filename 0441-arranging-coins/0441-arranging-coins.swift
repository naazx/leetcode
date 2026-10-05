class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var left = 1
        var right = n
        var result = 0
        
        while left <= right {
            let mid = left + (right - left) / 2
            let coinsNeeded = mid * (mid + 1) / 2
            
            if coinsNeeded == n {
                return mid
            } else if coinsNeeded < n {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}
