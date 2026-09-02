class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
            } else {
                let b = stack.removeLast()
                let a = stack.removeLast()
                
                switch token {
                case "+":
                    stack.append(a + b)
                case "-":
                    stack.append(a - b)
                case "*":
                    stack.append(a * b)
                case "/":
                    stack.append(a / b)
                default:
                    fatalError()
                }
            }
            
        }
        return stack.last ?? 0
    }
}