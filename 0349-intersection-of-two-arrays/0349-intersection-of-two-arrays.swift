class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = Set<Int>()
        for a in nums1 {
            for b in nums2 {
                if a == b {
                    result.insert(a)
                }
            }
        }
        return Array(result)
    }
}
