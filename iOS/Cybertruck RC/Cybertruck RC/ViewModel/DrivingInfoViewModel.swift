//

import Foundation

class DrivingInfoViewModel: ObservableObject {
    @Published var gear: Gears = .parking
    @Published var speed: Int = 0
    @Published var frontDistance: Int = 20
    @Published var isLeftBlinkerOn = false
    @Published var isRightBlinkerOn = false

    var maxSpeed: Int {
        let val = 10 * Int(round(Double(speed) / 10.0))
        return val == 0 ? 10 : val
    }
}
