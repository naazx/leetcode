class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        var current = [Int]()
        let sortedCandidates = candidates.sorted()

        func backtrack(_ startIndex: Int, _ remaining: Int) {
            if remaining == 0 {
                results.append(current)
                return
            }

            for i in startIndex..<sortedCandidates.count {
                let val = sortedCandidates[i]

                // Early exit: any further numbers will also exceed remaining
                if val > remaining {
                    break
                }

                // Skip duplicate elements at the same tree depth to avoid duplicate combinations
                if i > startIndex && val == sortedCandidates[i - 1] {
                    continue
                }

                current.append(val)
                // Pass `i + 1` because each number can only be used once
                backtrack(i + 1, remaining - val)
                current.removeLast() // Backtrack
            }
        }

        backtrack(0, target)
        return results
    }
}
