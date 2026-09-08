class TimeMap {
    var store: [String: [(value: String, timestamp: Int)]] = [:]


    init() {

    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((value, timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = store[key], !values.isEmpty else {
            return ""
        }
        
        var left: Int = 0
        var right: Int = values.count - 1
        var res: String = ""
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if values[mid].timestamp <= timestamp {
                res = values[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return res
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */