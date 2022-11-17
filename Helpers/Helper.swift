//
//  Helper.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import UIKit

/**
 * - Main Helper Functions
 */

class Helper {
    static let shared = Helper()

    private init() {
    }
    static func checkSubmitButton(btn: UIButton, disabled: Bool) {
        btn.isEnabled = !disabled
        btn.backgroundColor = disabled ? .clear: .systemTeal
        btn.borderWidth = 1.0
        btn.borderColor = disabled ? .systemTeal : .clear
        btn.setTitleColor(.white, for: .disabled)
        btn.setTitleColor(.white, for: .normal)
    }
    static func getIPAddress() -> String {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }

                guard let interface = ptr?.pointee else { return "" }
                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                    // wifi = ["en0"]
                    // wired = ["en2", "en3", "en4"]
                    // cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]

                    let name: String = String(cString: (interface.ifa_name))
                    if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t((interface.ifa_addr.pointee.sa_len)), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address ?? ""
    }
    static func getCurrentVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    static func getDeviceType() -> String {
        return "mobile"
    }
    static func getDeviceName() -> String {
        return "IPHONE"
    }
    static func generateCommonDatas(data: [String: Any]) -> [String: Any] {
        var params = data
        params["device"] = getDeviceName()
        params["deviceType"] = getDeviceType()
        params["ipAddress"] = getIPAddress()
        params["version"] = getCurrentVersion()
        return params
    }
}
