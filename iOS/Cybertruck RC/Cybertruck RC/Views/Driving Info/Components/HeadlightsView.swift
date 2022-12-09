//

import SwiftUI

struct HeadlightsView: View {
    let state: HeadlightState

    var body: some View {
        VStack {
            Group {
                if state == .low {
                    Image.headlightLowBeamIcon
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.green)
                } else {
                    Image.headlightHighBeamIcon
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.accentColor)
                        .rotationEffect(Angle(degrees: 180))
                }
            }
        }
        .frame(width: 35, height: 35)
        .opacity(state == .off ? 0 : 1)
    }
}

struct HeadlightsView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlightsView(state: .high)
    }
}
