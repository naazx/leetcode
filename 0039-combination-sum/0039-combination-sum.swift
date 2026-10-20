class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        var current = [Int]()
        let sortedNums = nums.sorted()

        func backtrack(_ startIndex: Int, _ remaining: Int) {
            if remaining == 0 {
                results.append(current)
                return
            }

            for i in startIndex..<sortedNums.count {
                let val = sortedNums[i]
                
                // Early termination: since sortedNums is sorted,
                // any subsequent number will also exceed `remaining`.
                if val > remaining {
                    break
                }

                current.append(val)
                // Recurse with index `i` (not `i + 1`) to allow using the same element multiple times
                backtrack(i, remaining - val)
                current.removeLast() // Backtrack
            }
        }

        backtrack(0, target)
        return results
    }
}
