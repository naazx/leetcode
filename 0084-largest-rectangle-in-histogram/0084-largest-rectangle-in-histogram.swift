class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        // Стек зберігає кортежі: (індекс початку прямокутника, висота)
        var stack: [(index: Int, height: Int)] = []
        
        for (i, h) in heights.enumerated() {
            var start = i
            
            // Поки поточна висота менша за висоту на вершині стека
            while let last = stack.last, last.height > h {
                stack.removeLast()
                let area = last.height * (i - last.index)
                maxArea = max(maxArea, area)
                // Новий нижчий стовпчик може починатися звідти, де починався вищий
                start = last.index
            }
            
            stack.append((index: start, height: h))
        }
        
        // Обробляємо елементи, які залишилися у стеку
        let totalCount = heights.count
        for item in stack {
            let area = item.height * (totalCount - item.index)
            maxArea = max(maxArea, area)
        }
        
        return maxArea
    }
}
