//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var BLE = BluetoothManager()
    @State var text = ""

    var body: some View {
        VStack {
            if let error = BLE.error {
                Text(error)
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }

            if BLE.connectedPeripheral != nil {
                HStack {
                    Spacer()
                    Color.green
                        .clipShape(Circle())
                        .frame(width: 10, height: 10)
                }

                HStack {
                    TextField("Data to send", text: $text)
                        .textFieldStyle(.roundedBorder)

                    Button("Send") {
                        BLE.write(text)
                        text = ""
                    }
                }
            } else {
                Button("Retry") {
                    if let peripheral = BLE.foundPeripheral {
                        BLE.connect(peripheral)
                    }
                }

                ProgressView()
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
