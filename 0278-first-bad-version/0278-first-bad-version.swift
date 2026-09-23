/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left: Int = 1
        var right: Int = n
        var ans: Int = n

        while left <= right {
            let mid = left + (right - left) / 2

            if isBadVersion(mid) {
                ans = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return ans
    }
}
