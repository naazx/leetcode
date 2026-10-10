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
    func isValidBST(_ root: TreeNode?) -> Bool {
        func validate(_ node: TreeNode?, _ low: Int?, _ high: Int?) -> Bool {
            guard let node = node else { return true }
            
            // Перевіряємо, чи поточне значення потрапляє у допустимий інтервал
            if let low = low, node.val <= low {
                return false
            }
            if let high = high, node.val >= high {
                return false
            }
            
            // Рекурсивно перевіряємо ліве та праве піддерева з новими межами
            return validate(node.left, low, node.val) && 
                   validate(node.right, node.val, high)
        }
        
        return validate(root, nil, nil)
    }
}
