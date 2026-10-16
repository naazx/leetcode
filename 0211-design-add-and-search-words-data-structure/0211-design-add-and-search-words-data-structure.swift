
class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isWord: Bool = false
}

class WordDictionary {
    private let root: TrieNode

    init() {
        self.root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        let chars = Array(word)
        
        func dfs(_ index: Int, _ node: TrieNode) -> Bool {
            var current = node
            
            for i in index..<chars.count {
                let char = chars[i]
                
                if char == "." {
                    // Если встретили точку, проверяем все возможные ветви
                    for child in current.children.values {
                        if dfs(i + 1, child) {
                            return true
                        }
                    }
                    return false
                } else {
                    // Обычная буква: переходим к следующему узлу, если он есть
                    guard let nextNode = current.children[char] else {
                        return false
                    }
                    current = nextNode
                }
            }
            
            return current.isWord
        }
        
        return dfs(0, root)
    }
}


/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */