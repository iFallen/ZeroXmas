//
//  ZXTabbarConfig.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/24.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
public class ZXTabbarItem: NSObject {
    public var embedInNavigation:  Bool    = true
    public var showAsPresent:      Bool    = false
    public var normalImage:        String  = ""
    public var selectedImage:      String  = ""
    public var title:              String  = ""
    
    override init() {
    }
    
    public init(_ dic: [String:Any]!) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    override public func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}


public class ZXTabBarConfig: ZXConfigProtocol {
    static var configDic: Dictionary<String, Any>?
    static var shareInstance: Dictionary<String, Any> {
        guard let config = configDic else {
            configDic = ((NSDictionary(contentsOfFile: Bundle.zx.tabBarConfigPath)) as! Dictionary<String, Any>)
            return configDic!
        }
        return config
    }
    
    public static var showSeparatorLine: Bool {
        return boolValue(for: "showSeparatorLine", defaultValue: true)
    }
    
    public static var isTranslucent: Bool {
        return boolValue(for: "isTranslucent", defaultValue: false)
    }
    
    public static var isCustomTitleFont: Bool {
        return boolValue(for: "isCustomTitleFont", defaultValue: false)
    }
    
    public static var customTitleFont: UIFont {
        return UIFont(name: customTitleFontName, size: customTitleFontSize)!
    }
    
    public static var customTitleFontSize: CGFloat {
        return fontSizeValue(for: "customTitleFontSize", defaultSize: 11)
    }
    
    static var customTitleFontName: String {
        return stringValue(for: "customTitleFontName", defaultValue: "Arial")
    }
    
    static var backgroundColorStr: String {
        return stringValue(for: "backgroundColor", defaultValue: "#ff0000")
    }
    
    public static var backgroundColor: UIColor {
        return UIColor.zx.hexStr(self.backgroundColorStr)
    }
    
    static var normalColorStr: String {
        return stringValue(for: "normalColor", defaultValue: "#ff0000")
    }
    
    public static var normalColor: UIColor {
        return UIColor.zx.hexStr(self.normalColorStr)
    }
    
    static var selectedColorStr: String {
        return stringValue(for: "selectedColor", defaultValue: "#ff0000")
    }
    
    public static var selectedColor: UIColor {
        return UIColor.zx.hexStr(self.selectedColorStr)
    }
    
    static var _barItems: [ZXTabbarItem]?
    public static var barItems: [ZXTabbarItem] {
        guard let items = _barItems, items.count > 0 else {
            if let its = shareInstance["barItems"] as? Array<Dictionary<String,Any>> {
                var arrItems: [ZXTabbarItem] = []
                for item in its {
                    arrItems.append(ZXTabbarItem(item))
                }
                _barItems = arrItems
                return arrItems
            }
            return []
        }
        return items
    }

    //MARK: - active
    static func active() {
        let appearance = UITabBar.appearance()
        appearance.isTranslucent  = self.isTranslucent
        appearance.barTintColor   = self.backgroundColor
        appearance.tintColor      = self.selectedColor
        if !self.showSeparatorLine {
            appearance.shadowImage = UIImage()
            appearance.backgroundImage = UIImage()
        }
        
        let tabBarItem = UITabBarItem.appearance()
        if !self.isCustomTitleFont {
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: self.normalColor], for: .normal)
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: self.selectedColor], for: .selected)
        } else {
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: self.normalColor,
                                               NSAttributedString.Key.font: self.customTitleFont],
                                              for: .normal)
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: self.selectedColor,
                                               NSAttributedString.Key.font: self.customTitleFont],
                                              for: .selected)
        }
    }
}
