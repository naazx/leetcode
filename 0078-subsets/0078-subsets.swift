class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var currentSubset: [Int] = []
        
        func backtrack(_ index: Int) {
            // Якщо дійшли до кінця масиву, фіксуємо сформовану підмножину
            if index == nums.count {
                result.append(currentSubset)
                return
            }
            
            // Вибір 1: Включаємо поточний елемент nums[index]
            currentSubset.append(nums[index])
            backtrack(index + 1)
            
            // Вибір 2: Не включаємо nums[index] (прибираємо його і йдемо далі)
            currentSubset.removeLast()
            backtrack(index + 1)
        }
        
        backtrack(0)
        return result
    }
}
