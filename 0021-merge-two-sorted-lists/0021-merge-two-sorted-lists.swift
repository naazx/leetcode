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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        
        var l1 = list1
        var l2 = list2
        
        while let node1 = l1, let node2 = l2 {
            if node1.val < node2.val {
                tail.next = node1
                l1 = node1.next
            } else {
                tail.next = node2
                l2 = node2.next
            }
            tail = tail.next!
        }
        
        tail.next = l1 ?? l2
        
        return dummy.next
    }
}
