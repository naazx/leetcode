class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var groups: [Int: [Int]] = [:]
        var resuls: [Int] = []
        
        for i in nums {
            groups[i, default: []].append(i)
        }
        
        let sortedGroups = groups.sorted { $0.value.count > $1.value.count }
        
        for i in 0..<k {
            resuls.append(sortedGroups[i].key)
        }
        
        return resuls
    }
}

