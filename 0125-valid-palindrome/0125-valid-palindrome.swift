class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var chars = Array(s.lowercased())
        var i = 0
        var j = chars.count - 1
        
        while i < j {
            if !chars[i].isLetter && !chars[i].isNumber {
                i += 1
                continue
            }
            
            if !chars[j].isLetter && !chars[j].isNumber {
                j -= 1
                continue
            }
            
            if chars[i] != chars[j] {
                return false
            }
            
            i += 1
            j -= 1
        }
        return true
    }
}
/* solution is correct, but is slow 
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var str = s.lowercased().filter { $0.isLetter || $0.isNumber}
        return str == String(str.reversed())
    }
}
*/