
class LRUCache {
    private final class Node {
        var key: Int
        var val: Int
        var prev: Node?
        var next: Node?

        init(_ key: Int = 0, _ val: Int = 0) {
            self.key = key
            self.val = val
        }
    }

    private let capacity: Int
    private var map: [Int: Node] = [:]
    private let head = Node()
    private let tail = Node()

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        remove(node)
        insertToHead(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.val = value
            remove(node)
            insertToHead(node)
        } else {
            if map.count >= capacity {
                if let lruNode = tail.prev, lruNode !== head {
                    remove(lruNode)
                    map.removeValue(forKey: lruNode.key)
                }
            }
            let newNode = Node(key, value)
            map[key] = newNode
            insertToHead(newNode)
        }
    }

    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    private func insertToHead(_ node: Node) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }
}


/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */