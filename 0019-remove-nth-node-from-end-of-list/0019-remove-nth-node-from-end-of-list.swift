/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }

        var nodes: [ListNode] = []
        var current: ListNode? = head

        while let node = current {
            nodes.append(node)
            current = node.next
        }

        let count = nodes.count
        let targetIndex = count - n

        // Якщо видаляємо перший елемент
        if targetIndex == 0 {
            return head.next
        }

        // Переприв'язуємо попередній вузол через один
        nodes[targetIndex - 1].next = nodes[targetIndex].next

        return head
    }
}
