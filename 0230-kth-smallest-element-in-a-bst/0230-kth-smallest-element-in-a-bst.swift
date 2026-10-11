/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var current = root
        var remaining = k
        
        while current != nil || !stack.isEmpty {
            // Йдемо максимально вліво, зберігаючи шлях у стек
            while let node = current {
                stack.append(node)
                current = node.left
            }
            
            // Дістаємо найменший доступний елемент
            let node = stack.removeLast()
            remaining -= 1
            
            // Якщо це k-й елемент — повертаємо його
            if remaining == 0 {
                return node.val
            }
            
            // Робимо крок у праве піддерево
            current = node.right
        }
        
        return -1
    }
}

