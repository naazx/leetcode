class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        
        var fleets = 0
        var currentLeaderTime: Double = 0
        
        var cars: [(pos: Int, speed: Int)] = []

        for i in 0..<position.count {
            cars.append((pos: position[i], speed: speed[i]))
        }
        
        cars.sort { $0.pos > $1.pos }
        
        for car in cars {
            let time = Double(target - car.pos) / Double(car.speed)
            
            if time > currentLeaderTime {
                fleets += 1
                currentLeaderTime = time
            }
        }

        return fleets
    }
}