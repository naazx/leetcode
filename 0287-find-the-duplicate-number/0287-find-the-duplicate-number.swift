class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0

        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast

        var slow2 = 0
        while slow != slow2 {
            slow = nums[slow]
            slow2 = nums[slow2]
        }

        return slow
    }
}