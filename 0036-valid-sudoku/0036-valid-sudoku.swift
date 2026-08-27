class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for row in 0..<9 {
            var seen = Set<Character>()
            for j in 0..<9 {
                if board[row][j] == "." {
                    continue
                }
                
                if seen.contains(board[row][j]) {
                    return false
                }
                seen.insert(board[row][j])
            }
        }
        
        for col in 0..<9 {
            var seen = Set<Character>()
            for i in 0..<9 {
                if board[i][col] == "." {
                    continue
                }
                
                if seen.contains(board[i][col]) {
                    return false
                }
                seen.insert(board[i][col])
            }
        }
        
        for startRow in stride(from: 0, to: 9, by: 3){
            for startCol in stride(from: 0, to: 9, by: 3) {
                var seen = Set<Character>()
                
                for i in 0..<3 {
                    for j in 0..<3 {
                        let cell = board[startRow + i][startCol + j]
                        
                        if cell == "." {
                            continue
                        }
                        
                        if seen.contains(cell) {
                            return false
                        }
                        
                        seen.insert(cell)
                    }
                }
            }
        }
        
        return true
    }
}
