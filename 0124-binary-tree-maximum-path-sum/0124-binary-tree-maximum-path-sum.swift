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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            // Якщо гілка дає від'ємний результат, відкидаємо її (беремо 0)
            let leftGain = max(0, dfs(node.left))
            let rightGain = max(0, dfs(node.right))
            
            // Варіант, де поточний вузол є вершиною розвороту шляху
            let currentPathSum = node.val + leftGain + rightGain
            maxSum = max(maxSum, currentPathSum)
            
            // Повертаємо нагору батьку лише одну гілку з максимальним внеском
            return node.val + max(leftGain, rightGain)
        }
        
        dfs(root)
        return maxSum
    }
}
