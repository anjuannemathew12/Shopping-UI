

import UIKit
import MBProgressHUD
extension UIView {
    
    @discardableResult func showHud() -> MBProgressHUD {
       let hud = MBProgressHUD.showAdded(to: self, animated: true)
        return hud
    }
    @discardableResult func showAnnularHud() -> MBProgressHUD {
       let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .annularDeterminate
        return hud
    }
    func hideHud() {
        MBProgressHUD.hide(for: self, animated: true)
    }
    
    
    
}
