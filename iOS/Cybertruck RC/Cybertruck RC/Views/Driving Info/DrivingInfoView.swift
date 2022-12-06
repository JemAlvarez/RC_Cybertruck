//

import SwiftUI

struct DrivingInfoView: View {
    @StateObject var viewModel = DrivingInfoViewModel()
    
    var body: some View {
        VStack(spacing: Constants.Padding.smallX) {
            HStack {
                GearsView(gear: viewModel.gear)
                    .onTapGesture {
                        withAnimation {
                            if viewModel.gear == .parking {
                                viewModel.gear = .driving
                            } else {
                                viewModel.gear = .parking
                            }
                        }
                    }

                Spacer()

                BlinkersView(
                    isLeftBlinkerOn: viewModel.isLeftBlinkerOn,
                    isRightBlinkerOn: viewModel.isRightBlinkerOn
                )

                Spacer()
                
                BatteryView()
                    .onTapGesture {
                        viewModel.isLeftBlinkerOn.toggle()
                    }
            }

            Divider()

            SpeedView(speed: viewModel.speed, maxSpeed: viewModel.maxSpeed)
                .onTapGesture {
                    withAnimation {
                        viewModel.speed += 5
                    }
                }

            ZStack {
                VStack {
                    HStack {
                        VStack {
                            // TODO: Headlights
                        }

                        Spacer()
                    }
                    Spacer()
                }

                CarView(distance: viewModel.frontDistance)
                    .onTapGesture {
                        viewModel.isRightBlinkerOn.toggle()
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
    }
}
