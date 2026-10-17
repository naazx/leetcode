class TrieNode {
    var children: [Character: TrieNode] = [:]
    var word: String? = nil // Храним само слово на конечном узле для удобства
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = TrieNode()
        
        // 1. Строим Trie из всех слов
        for word in words {
            var current = root
            for char in word {
                if current.children[char] == nil {
                    current.children[char] = TrieNode()
                }
                current = current.children[char]!
            }
            current.word = word
        }
        
        var board = board
        var result: [String] = []
        let rows = board.count
        let cols = board[0].count
        
        // 2. Функция DFS (Backtracking) для обхода сетки
        func dfs(_ r: Int, _ c: Int, _ parent: TrieNode) {
            let char = board[r][c]
            guard let currNode = parent.children[char] else { return }
            
            // Если нашли слово, добавляем в результат и обнуляем, чтобы избежать дубликатов
            if let foundWord = currNode.word {
                result.append(foundWord)
                currNode.word = nil
            }
            
            // Помечаем текущую ячейку как посещенную в рамках текущего пути
            board[r][c] = "#"
            
            // Смещения для соседних ячеек (вверх, вниз, влево, вправо)
            let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] != "#" {
                    dfs(nr, nc, currNode)
                }
            }
            
            // Возвращаем символ обратно (Backtracking)
            board[r][c] = char
            
            // Оптимизация: удаляем листовой узел, если в нем больше нет путей
            if currNode.children.isEmpty && currNode.word == nil {
                parent.children.removeValue(forKey: char)
            }
        }
        
        // 3. Запускаем поиск из каждой ячейки сетки
        for r in 0..<rows {
            for c in 0..<cols {
                if root.children[board[r][c]] != nil {
                    dfs(r, c, root)
                }
            }
        }
        
        return result
    }
}
