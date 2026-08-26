class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        nums.firstIndex(of: target) ?? nums.firstIndex(where: { $0 > target }) ?? nums.count
    }
}