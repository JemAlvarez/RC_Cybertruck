//

import Foundation
import CoreBluetooth

class BluetoothManager: NSObject, ObservableObject {
    private var central: CBCentralManager?
    var dataWaitingToWrite: Data?
    var characteristic: CBCharacteristic?

    var foundPeripheral: CBPeripheral? {
        didSet {
            if let foundPeripheral {
                self.connect(foundPeripheral)
            }
        }
    }

    @Published var connectedPeripheral: CBPeripheral?
    @Published var receivedData: String?
    @Published var error: String? = nil {
        didSet {
            if let _ = error {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                    self?.error = nil
                }
            }
        }
    }

    override init() {
        super.init()
        self.central = CBCentralManager(delegate: self, queue: .main)
    }

    func connect(_ peripheral: CBPeripheral) {
        self.central?.connect(peripheral)
    }

    func disconnect(_ peripheral: CBPeripheral) {
        self.central?.cancelPeripheralConnection(peripheral)
    }

    func write(_ string: String) {
        guard let connectedPeripheral, let characteristic, let data = stringToData(string) else { return }

        if connectedPeripheral.canSendWriteWithoutResponse {
            connectedPeripheral.writeValue(data, for: characteristic, type: .withoutResponse)
        } else {
            self.dataWaitingToWrite = data
        }
    }

    func stringToData(_ string: String) -> Data? {
        NSString(string: string).data(using: String.Encoding.utf8.rawValue)
    }
}
