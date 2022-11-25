//

import Foundation
import CoreBluetooth

extension BluetoothManager: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error {
            self.error = error.localizedDescription
        } else {
            if let services = peripheral.services {
                for service in services {
                    peripheral.discoverCharacteristics(nil, for: service)
                }
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error {
            self.error = error.localizedDescription
        } else {
            self.characteristic = connectedPeripheral?.services?.first?.characteristics?.first

            if let characteristic {
                self.connectedPeripheral?.setNotifyValue(true, for: characteristic)
            }
        }
    }

    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        if peripheral.canSendWriteWithoutResponse, let dataWaitingToWrite, let characteristic {
            peripheral.writeValue(dataWaitingToWrite, for: characteristic, type: .withoutResponse)
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error {
            self.error = error.localizedDescription
        } else {
            if let val = characteristic.value {
                self.receivedData = String(data: val, encoding: .utf8)
            }
        }
    }
}
