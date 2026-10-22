class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var visited = [Bool](repeating: false, count: nums.count)
        
        func backtrack() {
            // Базовий випадок: якщо довжина поточної комбінації дорівнює nums
            if current.count == nums.count {
                result.append(current)
                return
            }
            
            for i in 0..<nums.count {
                if !visited[i] {
                    // 1. Обираємо елемент
                    visited[i] = true
                    current.append(nums[i])
                    
                    // 2. Рекурсивний крок
                    backtrack()
                    
                    // 3. Скасовуємо дію (backtrack)
                    current.removeLast()
                    visited[i] = false
                }
            }
        }
        
        backtrack()
        return result
    }
}
