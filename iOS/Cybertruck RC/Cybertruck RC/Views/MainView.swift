//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                GearSelectorView()
                    .frame(width: proxy.size.width * 0.1)

                Divider()

                DrivingInfoView()
                    .frame(width: proxy.size.width * 0.4)

                Divider()

                ControlsView()
            }
            .symbolRenderingMode(.hierarchical)
            .environmentObject(MainViewModel())
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
