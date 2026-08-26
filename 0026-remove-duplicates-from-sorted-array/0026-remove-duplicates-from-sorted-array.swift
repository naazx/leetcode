class Solution {
   func removeDuplicates(_ nums: inout [Int]) -> Int {
        var setNumbers: Set<Int> = []
        nums = nums.filter{setNumbers.insert($0).inserted}
        return nums.count
    }
}