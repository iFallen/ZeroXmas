//
//  UITabBarViewController+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/29.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import UIKit

extension NSObject {
    public var zx_className: String {
        return String(describing: type(of: self))
    }
    
    public static var zx_className: String{
        return NSStringFromClass(type(of: self) as! AnyClass).components(separatedBy: ".").last!
    }
}


public class ZXPresentVCInfo: NSObject {
    public static var zxPresentVCsDic:Dictionary<String,ZXPresentVCInfo> = [:]
    public var className: String! = NSStringFromClass(UIViewController.self)
    public var barItem: ZXTabbarItem! = nil
}

extension ZeroXmas where Base: UITabBarController {
    
    
     /// AddChildViewController from ZXTabbarItem
     ///
     /// - Parameters:
     ///   - controller: controller
     ///   - item: ZXTabbarItem
     public func addChild(_ controller: UIViewController!,
                          from item:ZXTabbarItem) {
        var normalImage = UIImage.init(named: item.normalImage)
        normalImage     = normalImage?.withRenderingMode(.alwaysOriginal)
        
        var selectedImage   = UIImage.init(named: item.selectedImage)
        selectedImage       = selectedImage?.withRenderingMode(.alwaysOriginal)
        
        controller.tabBarItem.image = normalImage
        controller.tabBarItem.selectedImage = selectedImage
        controller.tabBarItem.title = item.title
        
        if item.showAsPresent {
            let mInfo = ZXPresentVCInfo.init()
            mInfo.className =  controller.zx_className
            mInfo.barItem = item
            ZXPresentVCInfo.zxPresentVCsDic["\((base.viewControllers?.count)!)"] = mInfo
            let emptyVC = UIViewController()
            emptyVC.tabBarItem.image = normalImage
            emptyVC.tabBarItem.selectedImage = selectedImage
            emptyVC.tabBarItem.title = item.title
            base.addChild(emptyVC)
        } else {
            if item.embedInNavigation,!controller.isKind(of: UINavigationController.self) {
                let nav = UINavigationController.init(rootViewController: controller)
                nav.tabBarItem.title = item.title
                base.addChild(nav)
            } else {
                base.addChild(controller)
            }
        }
    }
    
    /// AddChildViewController from PlistItemIndex config
    ///
    /// - Parameters:
    ///   - controller: Controller
    ///   - index: index config(title/image/font)
    public func addChild(_ controller:UIViewController!,
                         fromPlistItemIndex index:Int) {
        let count = ZXTabBarConfig.barItems.count
        if count > 0 ,index < count{
            addChild(controller, from: ZXTabBarConfig.barItems[index])
        }
    }
    
    /// If has present show vc in plist , return this in tabBarController shouldSelectViewController
    ///
    /// - Parameters:
    ///   - tabBarController: tabBarController description
    ///   - viewController: viewController description
    /// - Returns: true/false
    public static func tabBarController(_ tabBarController:UITabBarController,
                                        shouldSelectViewController viewController:UIViewController!) -> Bool {
        
        guard let viewcontrollers = tabBarController.viewControllers,
            let index = viewcontrollers.firstIndex(of: viewController) else { return false }
        
        guard let info = ZXPresentVCInfo.zxPresentVCsDic["\(index)"]  else {
            return true
        }
        if info.barItem.showAsPresent {
            var vcClass = NSClassFromString(info.className) as? UIViewController.Type
            if vcClass == nil {
                let className = Bundle.zx.projectName + "." + info.className
                vcClass = NSClassFromString(className) as? UIViewController.Type
            }
            if let vcClass = vcClass {
                let vc = vcClass.init()
                if info.barItem.embedInNavigation,!vc.isKind(of: UINavigationController.self) {
                    tabBarController.present(UINavigationController.init(rootViewController: vc), animated: true, completion: nil)
                } else {
                    tabBarController.present(vc, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
}

