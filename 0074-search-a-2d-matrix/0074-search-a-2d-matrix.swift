class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false}

        let m = matrix.count
        let n = matrix[0].count

        var low = 0
        var high = m * n - 1

        while low <= high {
            let mid = low + (high - low) / 2

            let row = mid / n
            let col = mid % n

            let midValue = matrix[row][col]

            if midValue == target {
                return true
            } else if midValue < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return false
    }
}
