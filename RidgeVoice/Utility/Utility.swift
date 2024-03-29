//
//  Utility.swift
//  RidgeVoice
//
//  Created by Sneha Joshi on 7/9/19.
//  Copyright © 2019 Sneha Joshi. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func isEmptyOrWhitespace() -> Bool {
        if(self.isEmpty) {
            return true
        }
        return (self.trimmingCharacters(in: NSCharacterSet.whitespaces) == "")
    }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}

extension UIAlertController {
     class func show(_ sender: UIViewController, _ title : String?, _ message : String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        sender.present(alert, animated: true, completion: nil)
    }
}

extension UIImage {
    func isEqualToImage(image: UIImage) -> Bool {
        if let data1 = self.pngData() as NSData?, let data2 = image.pngData() as NSData? {
            return data1.isEqual(data2)
        }
        return false
    }
}

extension UIViewController {
    var visibleViewController: UIViewController? {
        if presentedViewController == nil {
            return self
        }
        
        if let presented = presentedViewController {
            if presented is UINavigationController {
                let navigationController = presented as! UINavigationController
                return navigationController.viewControllers.last
            }
            
            if presented is UITabBarController {
                let tabBarController = presented as! UITabBarController
                return tabBarController.selectedViewController
            }
            
            return presented.visibleViewController
        }
        
        return nil
    }
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.clipsToBounds = true
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.white.cgColor
        self.contentMode = UIView.ContentMode.scaleToFill
    }
    func isEqual(to image: UIImage) -> Bool {
        return isEqual(image)
    }
}
extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

