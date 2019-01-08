//
//  TConfig.swift
//  ZeroXmas_Example
//
//  Created by screson on 2019/1/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ZeroXmas

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? { return  self.topViewController }
    open override var childForStatusBarHidden: UIViewController? { return self.topViewController }
}

class ZXUIViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    var preferredHidesBottomBarWhenPushed: Bool { return true }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.hidesBottomBarWhenPushed = self.preferredHidesBottomBarWhenPushed
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.hidesBottomBarWhenPushed = self.preferredHidesBottomBarWhenPushed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.zx.clearNavbarBackButtonTitle()
        view.backgroundColor = UIColor.zx.background
    }
}

//extension UIViewController {
//    open override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
//}

enum ZXSBControllerType: Int, CustomStringConvertible {
    case colorUsage
    
    var description: String {
        switch self {
        case .colorUsage:
            return "ColorUsageViewController"
        }
    }
}

extension ZeroXmas where Base:  UIStoryboard {
    
    static var sb: UIStoryboard { return UIStoryboard.init(name: "ZXDemos", bundle: nil) }
    
    static func controller(_ type: ZXSBControllerType) -> UIViewController {
        return sb.instantiateViewController(withIdentifier: type.description)
    }
}
