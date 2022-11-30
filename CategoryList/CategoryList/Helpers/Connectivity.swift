

import UIKit
import Alamofire
class Connectivity {
    
    static let shared = Connectivity()
    
    let reachabilityManager = NetworkReachabilityManager.default
    
    class func isReachable() -> Bool {
        
        return NetworkReachabilityManager()!.isReachable
    }
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.startListening { status in
            print("Reachability Status Changed: \(status)")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            switch status {
            case .notReachable:
                print("The network is not reachable")
                appDelegate.window?.rootViewController?.showAlertMessage(title: AppMessages.networkTitle, message: AppMessages.networkNotReachable, okButtonTitle: AppMessages.Ok)
            case .unknown :
                print("It is unknown whether the network is reachable")
                appDelegate.window?.rootViewController?.showAlertMessage(title: AppMessages.networkTitle, message: AppMessages.networkNotReachable, okButtonTitle: AppMessages.Ok)
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over either Ethernet or WiFi connection")
            case .reachable(.cellular):
                print("The network is reachable over the WWAN connection")
            }
        }
    }
}
