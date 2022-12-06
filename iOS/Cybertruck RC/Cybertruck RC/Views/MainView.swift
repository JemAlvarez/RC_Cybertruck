//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                DrivingInfoView()
                    .frame(width: proxy.size.width * 0.4)

                Divider()
                    .padding(.top, -(Constants.Padding.medium))

                ControlsView()
            }
            .symbolRenderingMode(.hierarchical)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
