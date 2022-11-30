

import UIKit
extension UIViewController {
    
    func showAlertMessage(title: String?, message: String?, okButtonTitle: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertMessage(title: String?, message: String?, actionTitles: [String?], actions: [((UIAlertAction) -> Void)?], cancelTitle: String? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        
        if (cancelTitle != nil) {
            
            let action = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showActionSheet(title: String?, message: String? = nil, actionTitles: [String?]?, titleTextColors: [UIColor?]? = nil, actions: [((UIAlertAction) -> Void)?]?, cancelActionTitle: String?, cancelAction: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if let actionNames = actionTitles {
            for (index, title) in actionNames.enumerated() {
                let action = UIAlertAction(title: title, style: .default, handler: actions?[index])
                if let color = titleTextColors?[index] {
                    action.setValue(color, forKey: "titleTextColor")
                }
                alert.addAction(action)
            }
        }
        
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: cancelAction)
        alert.addAction(cancelAction)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(alert, animated: true, completion: nil)
    }

}
