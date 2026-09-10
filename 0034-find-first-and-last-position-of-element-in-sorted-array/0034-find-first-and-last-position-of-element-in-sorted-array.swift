class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        func findBound(isFirst: Bool) -> Int {
            var left = 0
            var right = nums.count - 1
            var bound = -1

            while left <= right {
                let mid = left + (right - left) / 2

                if nums[mid] == target {
                    bound = mid
                    if isFirst {
                        right = mid - 1 
                    } else {
                        left = mid + 1  
                    }
                } else if nums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            return bound
        }

        let first = findBound(isFirst: true)
        if first == -1 {
            return [-1, -1]
        }
        let last = findBound(isFirst: false)

        return [first, last]
    }
}
