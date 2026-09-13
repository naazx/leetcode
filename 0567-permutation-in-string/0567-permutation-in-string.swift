class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        
        var targetCount: [Character: Int] = [:]
        var windowCount: [Character: Int] = [:]
        
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        let k = s1Arr.count
        
        for i in 0..<k {
            targetCount[s1Arr[i], default: 0] += 1
            windowCount[s2Arr[i], default: 0] += 1
        }
        
        if targetCount == windowCount {
             return true 
        }
        
        for i in k..<s2Arr.count {
            let incoming = s2Arr[i]
            let outgoing = s2Arr[i - k]
            
            windowCount[incoming, default: 0] += 1
            
            if windowCount[outgoing] == 1 {
                windowCount.removeValue(forKey: outgoing)
            } else {
                windowCount[outgoing]! -= 1
            }
            
            if targetCount == windowCount {
                return true
            }
        }
        
        return false
    }
}
