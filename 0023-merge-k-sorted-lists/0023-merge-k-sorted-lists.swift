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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var lists = lists
        
        while lists.count > 1 {
            var mergedLists: [ListNode?] = []
            
            for i in stride(from: 0, to: lists.count, by: 2) {
                let l1 = lists[i]
                let l2 = (i + 1 < lists.count) ? lists[i + 1] : nil
                mergedLists.append(mergeTwoLists(l1, l2))
            }
            
            lists = mergedLists
        }
        
        return lists[0]
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var p1 = l1
        var p2 = l2
        
        while let node1 = p1, let node2 = p2 {
            if node1.val < node2.val {
                tail?.next = node1
                p1 = node1.next
            } else {
                tail?.next = node2
                p2 = node2.next
            }
            tail = tail?.next
        }
        
        tail?.next = p1 ?? p2
        return dummy.next
    }
}
