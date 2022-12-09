//

import SwiftUI

struct CarView: View {
    let distance: Int

    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack {
                    Text("\(distance) cm")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.bottom, Constants.Padding.smallX)

                    Path { path in
                        path.move(to: CGPoint(x: proxy.size.width * 0.38, y: 0))
                        path.addCurve(
                            to: CGPoint(x: proxy.size.width * 0.6, y: 0),
                            control1: CGPoint(x: proxy.size.width * 0.44, y: -5),
                            control2: CGPoint(x: proxy.size.width * 0.54, y: -5)
                        )
                    }
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [10]))
                    .frame(width: proxy.size.width, height: 1)
                }
                .opacity(distance < 25 ? 1 : 0)

                Image.cybertruck
                    .resizable()
                    .scaledToFit()
            }
            .foregroundColor(.red)
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView(distance: 22)
    }
}
