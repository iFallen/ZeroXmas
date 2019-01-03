//
//  ZXNavBarConfig.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/24.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

public class ZXNavBarConfig: ZXConfigProtocol {
    static var configDic: Dictionary<String, Any>?
    static var shareInstance: Dictionary<String, Any> {
        guard let config = configDic else {
            configDic = ((NSDictionary(contentsOfFile: Bundle.zx.navBarConfigPath)) as! Dictionary<String, Any>)
            return configDic!
        }
        return config
    }
    //MARK: -
    public static var useSystemBackButtom: Bool {
        return boolValue(for: "useSystemBackButtom", defaultValue: true)
    }
    
    public static var showSeparatorLine: Bool {
        return boolValue(for: "showSeparatorLine", defaultValue: true)
    }
    
    public static var isTranslucent: Bool {
        return boolValue(for: "isTranslucent", defaultValue: false)
    }
    
    static var backgroundColorStr: String {
        return stringValue(for: "backgroundColor", defaultValue: "#ffffff")
    }
    
    public static var backgroundColor: UIColor {
        return UIColor.zx.hexStr(self.backgroundColorStr)
    }
    
    static var titleColorStr: String {
        return stringValue(for: "titleColor", defaultValue: "#ffffff")
    }
    
    public static var titleColor: UIColor {
        return UIColor.zx.hexStr(self.titleColorStr)
    }
    
    static var buttonTextColorStr: String {
        return stringValue(for: "buttonTextColor", defaultValue: "#ffffff")
    }
    
    public static var buttonTextColor: UIColor {
        return UIColor.zx.hexStr(self.buttonTextColorStr)
    }
    
    public static var titleFontName: String {
        return stringValue(for: "titleFontName", defaultValue: "Arial")
    }
    
    public static var titleFontSize: CGFloat {
        return fontSizeValue(for: "titleFontSize", defaultSize: 18)
    }
    
    public static var titleFont: UIFont {
        return UIFont(name: titleFontName, size: titleFontSize) ?? UIFont.systemFont(ofSize: titleFontSize)
    }
    
    public static var buttonFontSize: CGFloat {
        return fontSizeValue(for: "buttonFontSize", defaultSize: 16)
    }
    
    
    public static var buttonFont: UIFont {
        return UIFont.systemFont(ofSize: buttonFontSize)
    }
    
    //MARK: - active
    public static func active() {
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = self.isTranslucent
        appearance.barTintColor = self.backgroundColor
        appearance.tintColor = self.buttonTextColor
        
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self.titleColor,
                                          NSAttributedString.Key.font: self.titleFont]
        
        if !self.showSeparatorLine {
            appearance.shadowImage = UIImage()
            appearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        }
        
        if !self.useSystemBackButtom {
            guard let backImage = UIImage.zx.navBackImage else {
                assertionFailure("plist navBack Image is null...")
                return
            }
            appearance.backIndicatorImage = backImage
            appearance.backIndicatorTransitionMaskImage = backImage
        }
    }
}
