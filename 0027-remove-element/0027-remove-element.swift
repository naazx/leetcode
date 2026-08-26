class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var tempsNumbers: [Int] = nums.filter{ $0 != val }
        nums = tempsNumbers
        return nums.count
    }
}