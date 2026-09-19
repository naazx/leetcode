class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        
        var left = 0
        var right = height.count - 1
        
        var maxLeft = 0
        var maxRight = 0
        var totalWater = 0
        
        while left < right {
            if height[left] <= height[right] {
                if height[left] >= maxLeft {
                    maxLeft = height[left]
                } else {
                    totalWater += maxLeft - height[left]
                }
                left += 1
            } else {
                if height[right] >= maxRight {
                    maxRight = height[right]
                } else {
                    totalWater += maxRight - height[right]
                }
                right -= 1
            }
        }
        
        return totalWater
    }
}
