class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
    private let root: TrieNode

    init() {
        self.root = TrieNode()
    }
    
    func insert(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = findNode(for: word) else {
            return false
        }
        return node.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return findNode(for: prefix) != nil
    }
    
    // Допоміжний метод, щоб не дублювати код обходу в search та startsWith
    private func findNode(for string: String) -> TrieNode? {
        var current = root
        for char in string {
            guard let nextNode = current.children[char] else {
                return nil
            }
            current = nextNode
        }
        return current
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */