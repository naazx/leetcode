class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]
        
        for str in strs {
            let key = String(str.sorted())
            groups[key, default: []].append(str)
        }
        return Array(groups.values)
    }
}