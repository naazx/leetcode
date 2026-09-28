/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }

        // Крок 1: Створюємо клони та вставляємо їх після оригінальних вузлів
        var curr: Node? = head
        while let node = curr {
            let copy = Node(node.val)
            copy.next = node.next
            node.next = copy
            curr = copy.next
        }

        // Крок 2: Налаштовуємо random для скопійованих вузлів
        curr = head
        while let node = curr {
            if let random = node.random {
                node.next?.random = random.next
            }
            curr = node.next?.next
        }

        // Крок 3: Розділяємо списки
        let newHead = head.next
        curr = head
        var copyCurr = newHead

        while let node = curr {
            node.next = node.next?.next
            copyCurr?.next = copyCurr?.next?.next
            
            curr = node.next
            copyCurr = copyCurr?.next
        }

        return newHead
    }
}
