//
//  Extensions.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    
    func isEven() -> Bool {
        return self % 2 == 0
    }
    
    func isOdd() -> Bool {
        return !self.isEven()
    }
}

//MARK: UIViewController

//Hides the Navigation Bar Lip
extension UIViewController {
    
    func hideNavigationBarShadow() {
        let emptyImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = emptyImage
        self.navigationController?.navigationBar.setBackgroundImage(emptyImage, forBarMetrics: UIBarMetrics.Default)
    }
    
    var isiPhone: Bool {
        return UI_USER_INTERFACE_IDIOM() == .Phone
    }
    
    var isiPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == .Pad
    }
}


//MARK: String Operations
public extension String {
    public var length: Int { return self.characters.count }
    
    public func toURL() -> NSURL? {
        return NSURL(string: self)
    }
}

//MARK: UITableView Controllers
extension UITableViewController {
    func reloadSection(section: Int, animation: UITableViewRowAnimation = .Automatic) {
        
        let section = NSIndexSet(index: section)
        self.tableView?.reloadSections(section, withRowAnimation: animation)
    }
    
    func setSprayForBlackBackground() {
        
        let imageName = "spray.galaxy.black"
        setBackground(imageName)
    }
    
    func setSprayForWhiteBackground() {
        
        let imageName = "spray.galaxy"
        setBackground(imageName)
    }
    
    private func setBackground(imageName: String) {
        guard let image = UIImage(named: imageName) else { return }
        guard let frame = self.view?.frame else { return }
        let imageView = UIImageView(frame: frame)
        imageView.contentMode = .ScaleAspectFill
        imageView.image = image
        
        self.tableView.backgroundView = imageView
    }
}