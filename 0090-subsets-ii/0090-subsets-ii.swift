class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result = [[Int]]()
        var current = [Int]()

        func backtrack(_ startIndex: Int) {
            // Every valid subset is added to the result
            result.append(current)

            for i in startIndex..<sortedNums.count {
                // Skip duplicates at the same tree depth/level
                if i > startIndex && sortedNums[i] == sortedNums[i - 1] {
                    continue
                }

                current.append(sortedNums[i])
                backtrack(i + 1)
                current.removeLast() // Backtrack
            }
        }

        backtrack(0)
        return result
    }
}
