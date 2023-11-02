//
//  IP Address.swift
//  Menu Shortcuts
//
//  Created by Saketh C on 11/1/23.
//

import Foundation

func getIPAddress() -> String {
    var address: String = ""
    
    var addrList: UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&addrList) == 0, let firstAddr = addrList else { return address }
    defer { freeifaddrs(addrList) }
    
    for cursor in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let interfaceName = String(cString: cursor.pointee.ifa_name)
        
        if interfaceName == "en0" {
            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
            if let addr = cursor.pointee.ifa_addr, getnameinfo(addr, socklen_t(addr.pointee.sa_len), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST) == 0, hostname[0] != 0 {
                address = String(cString: hostname)
            } else {
                address = "?"
            }
            
            // LAN
            if address.starts(with: "192.168") {
                return address
            }
        }
    }
    
    return address
}
