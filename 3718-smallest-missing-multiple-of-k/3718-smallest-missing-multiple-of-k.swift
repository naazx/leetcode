class Solution {
    func missingMultiple(_ nums: [Int], _ k: Int) -> Int {
        let numbers = nums.filter { $0.isMultiple(of: k) }.sorted(by: <)

        var number = k
        while numbers.contains(number) {
          number = number + k
        }

        return number
    }
}