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
    func reorderList(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        
        var nodes: [ListNode] = []
        var current: ListNode? = head
        
        while let node = current {
            nodes.append(node)
            current = node.next
        }
        
        var left = 0
        var right = nodes.count - 1
        
        while left < right {
            nodes[left].next = nodes[right]
            left += 1
            
            if left >= right {
                break
            }
            
            nodes[right].next = nodes[left]
            right -= 1
        }
        
        nodes[left].next = nil
    }
}

