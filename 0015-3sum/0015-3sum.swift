class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var res: [[Int]] = []
        let n = sorted.count
        
        guard n >= 3 else { return [] }
        
        for i in 0..<n - 2 {
            if sorted[i] > 0 { 
                break
            }
            if i > 0 && sorted[i] == sorted[i - 1] {
                 continue 
                 }
            
            var left = i + 1
            var right = n - 1
            
            while left < right {
                let sum = sorted[i] + sorted[left] + sorted[right]
                
                if sum == 0 {
                    res.append([sorted[i], sorted[left], sorted[right]])
                    
                    while left < right && sorted[left] == sorted[left + 1]{     
                        left += 1 
                    }
                    while left < right && sorted[right] == sorted[right - 1]
                    {
                         right -= 1
                    }
                    
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return res
    }
}

/* O(n^3) Time | O(n) Space
// Проходить 312/316 тестів, падає на великих масивах через Time Limit Exceeded

class SolutionBruteForce {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = Set<[Int]>()
        let n = nums.count
        
        guard n >= 3 else { return [] }
        
        for i in 0..<n {
            for j in (i + 1)..<n {
                for k in (j + 1)..<n {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        let triplet = [nums[i], nums[j], nums[k]].sorted()
                        res.insert(triplet)
                    }
                }
            }
        }
        return Array(res)
    }
}
*/
