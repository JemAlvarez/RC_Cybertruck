//

import SwiftUI

class MainViewModel: ObservableObject {
    // MARK: - States
    @Published var gear: Gears = .parking
    @Published var speed: Int = 0
    @Published var frontDistance: Int = 0
    @Published var isLeftBlinkerOn = false
    @Published var isRightBlinkerOn = false
    @Published var headlightState: HeadlightState = .off

    // MARK: - Variables
    var maxSpeed: Int {
        let val = 10 * Int(round(Double(speed) / 10.0))
        return val == 0 ? 10 : val
    }

    // MARK: - getters/setters
    func shiftGear(to g: Gears) {
        withAnimation {
            gear = g
        }
    }
}
