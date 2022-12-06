//

import SwiftUI

struct SpeedView: View {
    let speed: Int
    let maxSpeed: Int

    var body: some View {
        HStack {
            speedView()

            Spacer()

            HStack {
                maxSpeedView()

                speedLimitSignView()
            }
        }
    }
}

struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView(speed: 15, maxSpeed: 20)
    }
}

extension SpeedView {
    private func speedView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(speed)")
                .font(.system(size: 60, weight: .light))

            Text("MPH")
                .font(.subheadline)
                .fontWeight(.light)
                .opacity(0.7)
        }
    }

    private func maxSpeedView() -> some View {
        VStack(spacing: 0) {
            Text("\(maxSpeed)")
                .font(.system(size: 25, weight: .semibold))

            Text("MAX")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color.accentColor)
        }
    }

    private func speedLimitSignView() -> some View {
        VStack {
            Group {
                Text("Speed")
                Text("Limit")
            }
            .font(.system(size: 8))
            .textCase(.uppercase)

            Text("\(maxSpeed)")
                .font(.system(size: 18))
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 2)
        .background(Color.white)
        .foregroundColor(Color.black)
        .cornerRadius(5)
        .shadow(radius: 3)
    }
}
