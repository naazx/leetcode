class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !s.isEmpty && !t.isEmpty && s.count >= t.count else { return "" }
        
        let sChars = Array(s)
        var targetCounts = [Character: Int]()
        for ch in t {
            targetCounts[ch, default: 0] += 1
        }
        
        var windowCounts = [Character: Int]()
        let need = targetCounts.count
        var have = 0
        
        var left = 0
        var minLen = Int.max
        var bestRange = (0, 0)
        
        for right in 0..<sChars.count {
            let ch = sChars[right]
            windowCounts[ch, default: 0] += 1
            
            if let targetNeed = targetCounts[ch], windowCounts[ch] == targetNeed {
                have += 1
            }
            
            // Стискаємо вікно зліва, поки воно валідне
            while have == need {
                let currentLen = right - left + 1
                if currentLen < minLen {
                    minLen = currentLen
                    bestRange = (left, right)
                }
                
                let leftChar = sChars[left]
                windowCounts[leftChar]! -= 1
                if let targetNeed = targetCounts[leftChar], windowCounts[leftChar]! < targetNeed {
                    have -= 1
                }
                
                left += 1
            }
        }
        
        return minLen == Int.max ? "" : String(sChars[bestRange.0...bestRange.1])
    }
}
