class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let numbers = nums.sorted(by: <)
    
        for i in 0..<numbers.count - 1 {
            if numbers[i] == numbers[i + 1] {
                return true
            }
        }
        return false
    }
}