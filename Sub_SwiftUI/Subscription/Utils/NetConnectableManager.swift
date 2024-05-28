//
//  NetworkManager.swift
//  Farming Simulator 2022
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import Foundation
import Network
import SwiftUI
import SystemConfiguration
import Combine

class RechbilitY_ThorfinnApp: ObservableObject {
    @Published var isConnected = true
    @Published var cancellable: AnyCancellable?
    @Published var lastIsConnectedValue: Bool?
    
    static func iS_ContdNet_To_Unix() -> Bool {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sa_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags = SCNetworkReachabilityFlags()
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        return (isReachable && !needsConnection)
    }
    
    func chkCNetInetConkt() -> AnyCancellable {
        return Timer.publish(every: 1.85, on: .main, in: .common)
            .autoconnect()
            .flatMap { _ in
                Future<Bool, Never> { promise in
                    DispatchQueue.global(qos: .background).async {
                        let isConnected = RechbilitY_ThorfinnApp.iS_ContdNet_To_Unix()
                        DispatchQueue.main.async {
                            if self.lastIsConnectedValue != isConnected {
                                self.lastIsConnectedValue = isConnected
                                self.isConnected = isConnected
                                promise(.success(isConnected))
                            }
                        }
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.isConnected, on: self)
    }
}
