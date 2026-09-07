class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        guard !s.isEmpty else { return 0 }
        let sArray = Array(s)
        let n = sArray.count

        var count = [Character: Int]()
        var left = 0
        var maxLen = 0

        for right in 0..<n {
            let length = right - left + 1
            count[sArray[right], default: 0] += 1
            let maxCount = count.values.max()!
            
            if length - maxCount > k {
                count[sArray[left]]! -= 1
                left += 1
            }
            
            maxLen = max(maxLen, right - left + 1)
        }

        return maxLen
    }
}