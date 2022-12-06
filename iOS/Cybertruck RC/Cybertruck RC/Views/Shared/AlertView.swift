//

import SwiftUI

struct AlertView: View {
    @Binding var showing: Bool {
        didSet {
            if showing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        showing = false
                    }
                }
            }
        }
    }
    let title: String
    let subtitle: String?
    let icon: String

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Image(systemName: icon)
                    .font(.title)

                VStack {
                    Text(title)
                        .font(.headline)

                    if let subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                    }
                }
            }
            .padding()
            .background(Color.backgroundSecondary)
            .clipShape(Capsule(style: .continuous))
            .offset(y: showing ? 0 : 100)
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(
            showing: .constant(true),
            title: "Bluetooth Connected!",
            subtitle: "Car is ready to be controlled",
            icon: "antenna.radiowaves.left.and.right"
        )
    }
}
