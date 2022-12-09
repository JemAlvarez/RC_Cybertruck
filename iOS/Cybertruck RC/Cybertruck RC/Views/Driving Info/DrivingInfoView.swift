//

import SwiftUI

struct DrivingInfoView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: Constants.Padding.smallX) {
            HStack {
                GearsView(gear: viewModel.gear)

                Spacer()

                BlinkersView(
                    isLeftBlinkerOn: viewModel.isLeftBlinkerOn,
                    isRightBlinkerOn: viewModel.isRightBlinkerOn
                )

                Spacer()
                
                BatteryView()
            }

            Divider()

            SpeedView(speed: viewModel.speed, maxSpeed: viewModel.maxSpeed)

            ZStack {
                VStack {
                    HStack {
                        HeadlightsView(state: viewModel.headlightState)

                        Spacer()
                    }
                    Spacer()
                }

                CarView(distance: viewModel.frontDistance)
                    .onTapGesture {
                        switch viewModel.headlightState {
                            case .high:
                                viewModel.headlightState = .off
                            case .low:
                                viewModel.headlightState = .high
                            case .off:
                                viewModel.headlightState = .low
                        }
                    }
            }
        }
        .padding()
        .background(Color.backgroundPrimary)
    }
}

struct DrivingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DrivingInfoView()
            .environmentObject(MainViewModel())
    }
}
