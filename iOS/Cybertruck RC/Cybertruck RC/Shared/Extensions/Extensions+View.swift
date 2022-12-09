//

import SwiftUI

extension View {
    /// Give view radius on custom corners
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners) )
    }
}
