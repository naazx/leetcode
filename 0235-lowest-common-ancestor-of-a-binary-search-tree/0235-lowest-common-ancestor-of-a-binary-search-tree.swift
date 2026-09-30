/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }
        var curr = root
        
        while let node = curr {
            if p.val < node.val && q.val < node.val {
                curr = node.left
            } else if p.val > node.val && q.val > node.val {
                curr = node.right
            } else {
                return node
            }
        }
        
        return nil
    }
}
