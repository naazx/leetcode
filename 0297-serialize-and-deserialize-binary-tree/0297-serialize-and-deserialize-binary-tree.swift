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

class Codec {
    // Кодуємо дерево в один рядок
    func serialize(_ root: TreeNode?) -> String {
        var res = [String]()
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else {
                res.append("N")
                return
            }
            res.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
        }
        
        dfs(root)
        return res.joined(separator: ",")
    }
    
    // Декодуємо рядок назад у дерево
    func deserialize(_ data: String) -> TreeNode? {
        // Розбиваємо рядок по комі
        let vals = data.split(separator: ",").map { String($0) }
        var i = 0
        
        func dfs() -> TreeNode? {
            if vals[i] == "N" {
                i += 1
                return nil
            }
            
            let node = TreeNode(Int(vals[i])!)
            i += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }
        
        return dfs()
    }
}