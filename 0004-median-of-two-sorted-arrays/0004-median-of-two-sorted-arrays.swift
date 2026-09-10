class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var A = nums1
        var B = nums2
        
        if A.count > B.count {
            swap(&A, &B)
        }
        
        let total = A.count + B.count
        let half = (total + 1) / 2
        
        var left = 0
        var right = A.count
        
        while left <= right {
            let i = (left + right) / 2       
            let j = half - i           
            
            let aLeft  = (i > 0) ? A[i - 1] : Int.min
            let aRight = (i < A.count) ? A[i] : Int.max
            
            let bLeft  = (j > 0) ? B[j - 1] : Int.min
            let bRight = (j < B.count) ? B[j] : Int.max
            
            if aLeft <= bRight && bLeft <= aRight {
                if total % 2 != 0 {
                    return Double(max(aLeft, bLeft))
                } else {
                    let leftMax = Double(max(aLeft, bLeft))
                    let rightMin = Double(min(aRight, bRight))
                    return (leftMax + rightMin) / 2.0
                }
            } else if aLeft > bRight {
                right = i - 1
            } else {
                left = i + 1
            }
        }
        
        return 0.0
    }
}
