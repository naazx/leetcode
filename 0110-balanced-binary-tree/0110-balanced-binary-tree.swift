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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return checkHeight(root) != -1
    }
    
    // Повертає висоту піддерева, або -1, якщо піддерево незбалансоване
    private func checkHeight(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        let leftHeight = checkHeight(node.left)
        if leftHeight == -1 { return -1 }
        
        let rightHeight = checkHeight(node.right)
        if rightHeight == -1 { return -1 }
        
        // Якщо різниця висот більша за 1 — дерево незбалансоване
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        
        // Повертаємо реальну висоту поточного вузла
        return 1 + max(leftHeight, rightHeight)
    }
}
