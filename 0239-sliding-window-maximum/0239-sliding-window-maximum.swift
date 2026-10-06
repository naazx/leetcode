class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty, k > 0 else { return [] }
        
        var result = [Int]()
        result.reserveCapacity(nums.count - k + 1)
        
        // Зберігаємо індекси елементів у порядку спадання їхніх значень
        var deque = [Int]()
        var head = 0 // Вказівник для емуляції pop_front за O(1)
        
        for i in 0..<nums.count {
            // 1. Видаляємо індекси, які вийшли за ліву межу поточного вікна [i - k + 1, i]
            if head < deque.count && deque[head] < i - k + 1 {
                head += 1
            }
            
            // 2. Підтримуємо монотонність: видаляємо з кінця всі елементи,
            // які менші або рівні поточному nums[i]
            while deque.count > head && nums[deque.last!] <= nums[i] {
                deque.removeLast()
            }
            
            // 3. Додаємо поточний індекс
            deque.append(i)
            
            // 4. Починаючи з індексу k - 1, перше повне вікно сформовано;
            // максимальний елемент завжди знаходиться на початку черги
            if i >= k - 1 {
                result.append(nums[deque[head]])
            }
        }
        
        return result
    }
}
