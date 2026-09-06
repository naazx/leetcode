class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArray = Array(s)
        var charSet = Set<Character>()
        var left = 0
        var maxLength = 0

        for right in 0..<sArray.count {
            while charSet.contains(sArray[right]) {
                charSet.remove(sArray[left])
                left += 1
            }
            
            charSet.insert(sArray[right])
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}
