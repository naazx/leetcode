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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxDiameter = 0
        
        // Допоміжна функція повертає висоту піддерева
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftHeight = dfs(node.left)
            let rightHeight = dfs(node.right)
            
            // Кількість ребер у шляху через поточний вузол
            maxDiameter = max(maxDiameter, leftHeight + rightHeight)
            
            // Висота поточного вузла для батьківського виклику
            return 1 + max(leftHeight, rightHeight)
        }
        
        dfs(root)
        return maxDiameter
    }
}
