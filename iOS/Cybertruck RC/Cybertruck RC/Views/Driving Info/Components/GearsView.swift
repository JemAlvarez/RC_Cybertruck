//

import SwiftUI

struct GearsView: View {
    let gear: Gears

    var body: some View {
        HStack {
            ForEach(Gears.allCases, id: \.rawValue) { g in
                Text(g.rawValue)
                    .opacity(gear == g ? 1 : 0.3)
                    .foregroundColor(gear == g ? .accentColor : .primary)
                    .fontWeight(gear == g ? .bold : .regular)
            }
        }
    }
}

struct GearsView_Previews: PreviewProvider {
    static var previews: some View {
        GearsView(gear: .parking)
    }
}
