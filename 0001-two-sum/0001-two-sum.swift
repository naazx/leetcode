class Solution {
   func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var resultArray: [Int] = []
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                resultArray.append(i)
                resultArray.append(j)
                return resultArray
            }
        }
    }
    return resultArray
    }
}