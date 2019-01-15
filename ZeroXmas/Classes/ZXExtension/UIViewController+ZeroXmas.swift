//
//  UIViewController+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/25.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

extension ZeroXmas where Base: UIViewController {
    
    /// AddKeyboardNotification
    public func addKeyboardNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(base, selector: #selector(base.baseKeyboardWillShow(notice:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(base, selector: #selector(base.baseKeyboardWillHide(notice:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(base, selector: #selector(base.baseKeyboardWillChangeFrame(notice:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    /// RemoveKeyboardNotification
    public func removeKeyboardNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    /// KeyWindow rootViewController
    public static var rootViewController: UIViewController {
        var keyVC = UIApplication.shared.keyWindow?.rootViewController
        repeat{
            if let presentedVC = keyVC?.presentedViewController {
                keyVC = presentedVC
            }else {
                break
            }
        } while ((keyVC?.presentedViewController) != nil)
        return keyVC!
    }
    
    /// Add Application Notice
    public func addApplicationNotice() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(base.zx_appWillResignActive(notice:)), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(base.zx_appDidBecomeActive(notice:)), name: UIApplication.didBecomeActiveNotification, object: nil)

        notificationCenter.addObserver(self, selector: #selector(base.zx_appWillEnterForeground(notice:)), name: UIApplication.willEnterForegroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(base.zx_appDidEnterBackground(notice:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(base.zx_appWillTerminate(notice:)), name: UIApplication.willTerminateNotification, object: nil)
    }
    
    public func remoteApplicationNotice() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIApplication.willTerminateNotification, object: nil)
    }
}

extension UIViewController{
    
    @objc open func zx_appWillResignActive(notice: Notification) {}
    @objc open func zx_appDidBecomeActive(notice: Notification) {}
    @objc open func zx_appWillEnterForeground(notice: Notification) {}
    @objc open func zx_appDidEnterBackground(notice: Notification) {}
    @objc open func zx_appWillTerminate(notice: Notification) {}
    
    /// zx_keyboardWillShow
    ///
    /// - Parameters:
    ///   - dt: duration
    ///   - userInfo: userInfo description
    @objc open func zx_keyboardWillShow(duration dt: Double,userInfo:Dictionary<String,Any>) {}
    
    /// zx_keyboardWillHide
    ///
    /// - Parameters:
    ///   - dt: duration
    ///   - userInfo: userInfo description
    @objc open func zx_keyboardWillHide(duration dt: Double,userInfo:Dictionary<String,Any>) {}
    
    /// zx_keyboardWillChangeFrame
    ///
    /// - Parameters:
    ///   - beginRect: beginRect
    ///   - endRect: endRect
    ///   - dt: duration
    ///   - userInfo: userInfo description
    @objc open func zx_keyboardWillChangeFrame(beginRect:CGRect,
                                               endRect: CGRect,
                                               duration dt:Double,
                                               userInfo:Dictionary<String,Any>) {}
    
    
    @objc final func baseKeyboardWillShow(notice:Notification) {
        if let userInfo = notice.userInfo as? Dictionary<String, Any> {
            let dt = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            zx_keyboardWillShow(duration: dt, userInfo:userInfo )
        }
    }
    
    @objc final func baseKeyboardWillHide(notice:Notification) {
        if let userInfo = notice.userInfo as? Dictionary<String, Any> {
            let dt = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            zx_keyboardWillHide(duration: dt, userInfo: userInfo)
        }
    }
    
    @objc final func baseKeyboardWillChangeFrame(notice:Notification) {
        if let userInfo = notice.userInfo as? Dictionary<String, Any> {
            let beginRect   = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
            let endRect     = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            let dt          = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            zx_keyboardWillChangeFrame(beginRect: beginRect, endRect: endRect, duration: dt, userInfo: userInfo)
        }
    }
    
    //MARK: -
    @objc open func zx_refresh() {
        
    }
    
    @objc open func zx_loadmore() {
        
    }
}

//MARK: - NavControl

public enum ZXNavBarButtonItemPosition {
    case left,right
}


//MARK: - Navigation Control
extension ZeroXmas where Base: UIViewController {
    /// Clear backBarButtonItem Title
    ///
    /// - Parameter replaceBackItem: default true , if false , set the leftBarButtonItem
    public func clearNavbarBackButtonTitle(replaceBackItem: Bool = true) {
        if replaceBackItem {
            let backItem = UIBarButtonItem(title: " ", style: .done, target: base, action: #selector(base.zx_navbackAction))
            base.navigationItem.backBarButtonItem = backItem
        } else {
            let backItem = UIBarButtonItem(image: UIImage.zx.navBackImage, style: .done, target: base, action: #selector(base.zx_navbackAction))
            base.navigationItem.leftBarButtonItem = backItem
        }
    }
    
    /// Add BarButton Item from Image names
    ///
    /// - Parameters:
    ///   - names: image names
    ///   - useOriginalColor: (true - imageColor false - bar tintcolor)
    ///   - position: .left .right
    public func addNavBarButtonItems(imageNames names:Array<String>,
                                        useOriginalColor:Bool,
                                        at position:ZXNavBarButtonItemPosition,
                                        fixSpace: CGFloat = 0) {
        if names.count > 0 {
            var items: Array<UIBarButtonItem> = Array()
            var n = 0
            for imgName in names {
                if names.count > 1 {
                    let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                    negativeSpacer.width = fixSpace
                    items.append(negativeSpacer)
                }
                
                var itemT:UIBarButtonItem!
                var image = UIImage.init(named: imgName)
                if useOriginalColor {
                    image = image?.withRenderingMode(.alwaysOriginal)
                }
                if position == .right {
                    itemT = UIBarButtonItem.init(image: image, style: .plain, target: base, action: #selector(base.xxx_rightBarButtonAction(sender:)))
                } else {
                    itemT = UIBarButtonItem.init(image: image, style: .plain, target: base, action: #selector(base.xxx_leftBarButtonAction(sender:)))
                }
                itemT.tag = n
                n += 1
                items.append(itemT)
            }
            if position == .left {
                base.navigationItem.leftBarButtonItems = items
            } else {
                base.navigationItem.rightBarButtonItems = items
            }
        } else {
            if position == .left {
                base.navigationItem.leftBarButtonItems = nil
            } else {
                base.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    
    /// Add BarButton Item by texts
    ///
    /// - Parameters:
    ///   - names: text title
    ///   - font: text font (Default:ZXNavBarConfig.navTilteFont)
    ///   - color: text color (Default:UIColor.zx_navBarButtonColor)
    ///   - position: .left .right
    public func addNavBarButtonItems(textNames names:Array<String>,
                                        font:UIFont?,
                                        color:UIColor?,
                                        at position:ZXNavBarButtonItemPosition,
                                        fixSpace:CGFloat = 0) {
        if names.count > 0 {
            var items: Array<UIBarButtonItem> = Array()
            var n = 0
            for title in names {
                if names.count > 1 {
                    let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                    negativeSpacer.width = fixSpace
                    items.append(negativeSpacer)
                }
                var itemT:UIBarButtonItem!
                if position == .right {
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: base, action: #selector(base.xxx_rightBarButtonAction(sender:)))
                } else {
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: base, action: #selector(base.xxx_leftBarButtonAction(sender:)))
                }
                itemT.tag = n
                n += 1
                let config = [NSAttributedString.Key.font:font ?? ZXNavBarConfig.buttonFont,
                              NSAttributedString.Key.foregroundColor: color ?? UIColor.zx.navBar.buttonText]
                itemT.setTitleTextAttributes(config , for: .normal)
                itemT.setTitleTextAttributes(config , for: .highlighted)
                itemT.setTitleTextAttributes(config , for: .selected)

                items.append(itemT)
                
            }
            if position == .left {
                base.navigationItem.leftBarButtonItems = items
            } else {
                base.navigationItem.rightBarButtonItems = items
            }
        } else {
            if position == .left {
                base.navigationItem.leftBarButtonItems = nil
            } else {
                base.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    
    /// Add BarButton Item by iconfont Unicode Text
    ///
    /// - Parameters:
    ///   - names: iconfont Unicode Text
    ///   - size: font size
    ///   - color: font color (Default UIColor.zx_navBarButtonColor)
    ///   - position: .left .right
    public func addNavBarButtonItems(iconFontTexts names:Array<String>,
                                     fontSize size:CGFloat,
                                     color:UIColor?,
                                     at position:ZXNavBarButtonItemPosition,
                                     fixSpace:CGFloat = 0) {
        if names.count > 0 {
            var items: Array<UIBarButtonItem> = Array()
            var n = 0
            for title in names {
                if names.count > 1 {
                    let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                    negativeSpacer.width = fixSpace
                    items.append(negativeSpacer)
                }
                
                var itemT:UIBarButtonItem!
                if position == .right {
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: base, action: #selector(base.xxx_rightBarButtonAction(sender:)))
                } else {
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: base, action: #selector(base.xxx_leftBarButtonAction(sender:)))
                }
                let config = [NSAttributedString.Key.font: UIFont.zx.iconFont(size),
                              NSAttributedString.Key.foregroundColor: color ?? UIColor.zx.navBar.buttonText]
                itemT.setTitleTextAttributes(config , for: .normal)
                itemT.setTitleTextAttributes(config , for: .highlighted)
                itemT.setTitleTextAttributes(config , for: .selected)

                itemT.tag = n
                n += 1
                items.append(itemT)
            }
            if position == .left {
                base.navigationItem.leftBarButtonItems = items
            } else {
                base.navigationItem.rightBarButtonItems = items
            }
        } else {
            if position == .left {
                base.navigationItem.leftBarButtonItems = nil
            } else {
                base.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    /// Add BarButton Item with custom view
    ///
    /// - Parameters:
    ///   - view: view
    ///   - position: left / right
    ///   - fixSpace: 0
    public func addNavBarButtonItems(customView view:UIView!,
                                     at position:ZXNavBarButtonItemPosition,
                                     fixSpace:CGFloat = 0) {
        var items: Array<UIBarButtonItem> = Array()
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = fixSpace
        items.append(negativeSpacer)
        
        let itemT = UIBarButtonItem.init(customView: view)
        items.append(itemT)
        
        if position == .left {
            base.navigationItem.leftBarButtonItems = items
        } else {
            base.navigationItem.rightBarButtonItems = items
        }
    }
    
    
    /// Change NavBar BackgroundColor
    ///
    /// - Parameter color: color
    public func setNavBarBackgroundColor(_ color: UIColor!) {
        base.navigationController?.navigationBar.barTintColor = color
        if color == UIColor.clear {
            base.navigationController?.navigationBar.isTranslucent = true
            base.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .compact)
        } else {
            base.navigationController?.navigationBar.isTranslucent = false
        }
    }
    
    /// Change TabBar BackgroundColor
    ///
    /// - Parameter color: color
    public func setTabBarBackgroundColor(_ color:UIColor!) {
        base.tabBarController?.tabBar.barTintColor = color
        if color == UIColor.clear {
            base.tabBarController?.tabBar.isTranslucent = true
            base.tabBarController?.tabBar.backgroundImage = UIImage()
        } else {
            base.tabBarController?.tabBar.isTranslucent = false
        }
    }
}

extension UIViewController {
    @objc func zx_navbackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    /// Right BarButton Action
    ///
    /// - Parameter index if item count > 0: index 0...
    @objc open func zx_rightBarButtonAction(index: Int) {
        
    }
    
    /// Left BarButton Action
    ///
    /// - Parameter index if item count > 0 : index 0...
    @objc open func zx_leftBarButtonAction(index: Int) {
        
    }
    
    @objc final func xxx_rightBarButtonAction(sender:UIBarButtonItem) {
        zx_rightBarButtonAction(index: sender.tag)
    }
    
    @objc final func xxx_leftBarButtonAction(sender:UIBarButtonItem) {
        zx_leftBarButtonAction(index: sender.tag)
    }
}
