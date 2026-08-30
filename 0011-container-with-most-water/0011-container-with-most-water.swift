class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var areas: [Int] = []
        var left = 0
        var right = heights.count - 1

        while left < right {
            var area = min(heights[left], heights[right]) * (right - left)
            areas.append(area)
            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return areas.max() ?? 0
    }
}
