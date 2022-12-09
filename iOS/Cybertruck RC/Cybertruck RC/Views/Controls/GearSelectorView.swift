//

import SwiftUI

struct GearSelectorView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var carViewOffset: CGFloat = .zero

    var body: some View {
        VStack {
            parkButton()
                .opacity(viewModel.gear == .parking ? 0 : 1)

            Spacer()

            carControl()

            Spacer()

            neutralButton()
        }
        .padding(.vertical, Constants.Padding.medium)
        .padding(.horizontal, Constants.Padding.smallX)
        .frame(maxWidth: .infinity)
        .background(Color.backgroundSecondary)
    }
}

struct GearSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        GearSelectorView()
            .environmentObject(MainViewModel())
    }
}


// MARK: - views
extension GearSelectorView {
    func carControl() -> some View {
        VStack(spacing: 0) {
            if viewModel.gear == .driving {
                Image(systemName: "arrow.up")
            }

            Image.carTopViewIcon
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.primary)
                .scaleEffect(2)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation {
                                if gesture.translation.height < 100 {
                                    carViewOffset = -600
                                } else if gesture.translation.height > 100 {
                                    carViewOffset = 600
                                }
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                if carViewOffset < 0 {
                                    viewModel.shiftGear(to: .driving)
                                } else {
                                    viewModel.shiftGear(to: .reverse)
                                }

                                carViewOffset = .zero
                            }
                        }
                )

            if viewModel.gear == .reverse {
                Image(systemName: "arrow.down")
            }
        }
        .contentShape(Rectangle())
        .offset(y: carViewOffset * 0.05)
    }

    func neutralButton() -> some View {
        VStack {
            Text("N")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, Constants.Padding.smallX)

            VStack {
                Text("Hold")
            }
            .font(.caption)
            .padding(.top, Constants.Padding.smallX)
        }
        .foregroundColor(viewModel.gear == .neutral ? Color.white : Color.primary)
        .padding(Constants.Padding.smallX)
        .frame(maxWidth: .infinity)
        .background(viewModel.gear == .neutral ? Color.accentColor : Color.backgroundTertiary)
        .cornerRadius(10)
        .cornerRadius(99, corners: .bottomLeft)
        .onLongPressGesture(minimumDuration: 1) {
            viewModel.shiftGear(to: .neutral)
        }
    }

    func parkButton() -> some View {
        Button(action: {
            viewModel.shiftGear(to: .parking)
        }) {
            VStack {
                Text("P")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, Constants.Padding.smallX)

                VStack {
                    Text("Tap to")
                    Text("PARK")
                }
                .font(.caption)
                .padding(.top, Constants.Padding.smallX)
            }
            .foregroundColor(Color.primary)
            .padding(Constants.Padding.smallX)
            .frame(maxWidth: .infinity)
            .background(Color.backgroundTertiary)
            .cornerRadius(10)
            .cornerRadius(99, corners: .topLeft)
        }
    }
}
