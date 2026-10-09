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
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        func dfs(_ node: TreeNode?, _ maxVal: Int) -> Int {
            guard let node = node else { return 0 }
            
            var total = 0
            if node.val >= maxVal {
                total = 1
            }
            
            let currentMax = max(maxVal, node.val)
            total += dfs(node.left, currentMax)
            total += dfs(node.right, currentMax)
            
            return total
        }
        
        return dfs(root, root.val)
    }
}
