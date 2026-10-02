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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        
        // groupPrev вказує на вузол безпосередньо ПЕРЕД поточною групою з k елементів
        var groupPrev: ListNode? = dummy
        
        while true {
            // 1. Шукаємо k-тий вузол поточної групи
            guard let kth = getKth(groupPrev, k) else {
                break
            }
            let groupNext = kth.next
            
            // 2. Розвертаємо поточну групу з k вузлів
            var prev = groupNext
            var curr = groupPrev?.next
            
            while curr !== groupNext {
                let tmp = curr?.next
                curr?.next = prev
                prev = curr
                curr = tmp
            }
            
            // 3. Зшиваємо вказівники та зміщуємо groupPrev для наступної ітерації
            let newGroupEnd = groupPrev?.next
            groupPrev?.next = kth
            groupPrev = newGroupEnd
        }
        
        return dummy.next
    }
    
    // Допоміжна функція: крокує на k позицій уперед
    private func getKth(_ curr: ListNode?, _ k: Int) -> ListNode? {
        var node = curr
        var count = 0
        while node != nil && count < k {
            node = node?.next
            count += 1
        }
        return node
    }
}
