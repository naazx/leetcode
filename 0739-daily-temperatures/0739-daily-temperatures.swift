class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: temperatures.count)
        var stack: [Int] = []
        let n = temperatures.count
        
        for i in 0..<n {
            while let lastIndex = stack.last, temperatures[i] > temperatures[lastIndex] {
                let prevIndex = stack.removeLast()
                res[prevIndex] = i - prevIndex
            }
            stack.append(i)
        }
        
        return res
    }
}


/*
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: temperatures.count)
        
        let n = temperatures.count
        for i in 0..<n {
            for j in (i + 1)..<n {
                if temperatures[j] > temperatures[i] {
                    res[i] = j - i
                    break
                }
            }
        }
        
        return res
    }
} */
