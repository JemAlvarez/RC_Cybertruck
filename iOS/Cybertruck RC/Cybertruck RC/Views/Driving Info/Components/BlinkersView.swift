//

import SwiftUI

struct BlinkersView: View {
    let isLeftBlinkerOn: Bool
    let isRightBlinkerOn: Bool

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var isBlinking = false

    var body: some View {
        HStack {
            blinkerView(left: true)
                .opacity(isLeftBlinkerOn ? 1 : 0)

            blinkerView(left: false)
                .opacity(isRightBlinkerOn ? 1 : 0)
        }
        .onReceive(timer) { _ in
            isBlinking.toggle()
        }
    }
}

struct BlinkersView_Previews: PreviewProvider {
    static var previews: some View {
        BlinkersView(
            isLeftBlinkerOn: true,
            isRightBlinkerOn: true
        )
    }
}

extension BlinkersView {
    private func blinkerView(left: Bool) -> some View {
        ZStack {
            Circle()
                .fill(Color.green)
                .frame(width: 22)

            if left {
                Image(systemName: "arrowtriangle.left.fill")
            } else {
                Image(systemName: "arrowtriangle.right.fill")
            }
        }
        .font(.caption2)
        .foregroundColor(Color.white.opacity(isBlinking ? 0.5 : 1))
    }
}
