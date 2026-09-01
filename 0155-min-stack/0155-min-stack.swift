
class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    init() {
        
    }
    
    func push(_ val: Int) {
        stack.append(val)
        
        if minStack.isEmpty || minStack.last! >= val {
            minStack.append(val)
        }
    }

    func pop() {
        guard !stack.isEmpty else{
            return
        }
        
        let popped = stack.removeLast()
        
        if popped == minStack.last {
            minStack.removeLast()
        }
    }

    func top() -> Int {
        return stack.last ?? 0
    }

    func getMin() -> Int {
        return minStack.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(value)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */