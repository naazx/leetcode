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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // Створюємо хеш-таблицю для пошуку індексу за O(1)
        var inorderMap = [Int: Int]()
        for (index, val) in inorder.enumerated() {
            inorderMap[val] = index
        }
        
        var preorderIndex = 0
        
        func helper(_ left: Int, _ right: Int) -> TreeNode? {
            // Базовий випадок: межі перетнулися, піддерево порожнє
            if left > right {
                return nil
            }
            
            // Наступний доступний елемент у preorder — це корінь піддерева
            let rootVal = preorder[preorderIndex]
            preorderIndex += 1
            
            let root = TreeNode(rootVal)
            let mid = inorderMap[rootVal]!
            
            // Спочатку обов'язково будуємо ліве піддерево, бо порядок preorder: Root -> Left -> Right
            root.left = helper(left, mid - 1)
            root.right = helper(mid + 1, right)
            
            return root
        }
        
        return helper(0, inorder.count - 1)
    }
}
