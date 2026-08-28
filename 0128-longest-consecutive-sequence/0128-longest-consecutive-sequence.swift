class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var numbers = Set(nums).sorted(by: <)
        var currentStreak = 1
        var streaks: [Int] = []
        
        
        for i in 0..<numbers.count-1 {
            if  numbers[i] != numbers[i+1] - 1 {
                streaks.append(currentStreak)
                currentStreak = 1
            } else {
                currentStreak += 1
            }
        }
        streaks.append(currentStreak)
    
        return streaks.max() ?? 0
    }
}