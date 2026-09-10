class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted() 
        var left = 0
        var right = sortedNums.count
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if sortedNums[mid] > mid {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
