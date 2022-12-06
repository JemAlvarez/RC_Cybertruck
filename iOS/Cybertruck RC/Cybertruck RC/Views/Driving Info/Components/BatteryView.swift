//

import SwiftUI

struct BatteryView: View {
    var body: some View {
        HStack {
            Text("75 %")
                .font(.headline)
            Image(systemName: "battery.75")
                .font(.title2)
        }
        .opacity(0.7)
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView()
    }
}
