class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return []
    }
}

/* slower again 😭
class SolutionLinearSearch {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        let n = numbers.count
        
        for i in 0..<n {
            let complement = target - numbers[i]
            if let j = numbers.firstIndex(of: complement), i != j {
                return [i + 1, j + 1]
            }
        }
        
        return []
    }
}
*/