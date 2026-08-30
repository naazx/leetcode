class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var results = [Int](repeating: 1, count: n)
        
        var prefix = 1
        for i in 0..<n {
            results[i] = prefix
            prefix *= nums[i]
        }
        
        var postfix = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            results[i] *= postfix
            postfix *= nums[i]
        }
        
        return results
    }
}
