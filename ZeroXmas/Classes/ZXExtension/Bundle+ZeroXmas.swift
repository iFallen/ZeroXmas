//
//  Bundle+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/21.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

extension ZeroXmas where Base: Bundle {
    
    /// Setting.bundle
    public static var settingBundle: Bundle {
        guard let path =  Bundle(for: ZXTintColorConfig.self).path(forResource: "ZXSettings", ofType: "bundle"),
            let bundle = Bundle.init(path: path) else {
            fatalError("ZeroXmas ZXSettings.bundle is missing!")
        }
        return bundle
    }
    
    /// TintColorConfig plist path
    public static var tintColorConfigPath: String {
        guard let path = settingBundle.path(forResource: "ZXConfig/ZXTintColorConfig", ofType: "plist") else {
            fatalError("ZeroXmas ZXTintColorConfig.plist is missing!")
        }
        return path
    }
    
    /// FontConfig plist path
    public static var fontConfigPath: String {
        guard let path = settingBundle.path(forResource: "ZXConfig/ZXFontConfig", ofType: "plist") else {
            fatalError("ZeroXmas ZXFontConfig.plist is missing!")
        }
        return path
    }
    
    /// NavBarConfig plist path
    public static var navBarConfigPath: String {
        guard let path = settingBundle.path(forResource: "ZXConfig/ZXNavBarConfig", ofType: "plist") else {
            fatalError("ZeroXmas ZXNavBarConfig.plist is missing!")
        }
        return path
    }
    
    /// TabBarConfig plist path
    public static var tabBarConfigPath: String {
        guard let path = settingBundle.path(forResource: "ZXConfig/ZXTabBarConfig", ofType: "plist") else {
            fatalError("ZeroXmas ZXTabBarConfig.plist is missing!")
        }
        return path
    }
    
    ///NavBackImageName
    public static var navBackImageNameStr: String? {
        let scale = Int(UIScreen.main.scale)
        return settingBundle.path(forResource: "zx_navback@\(scale)x", ofType: "png")
    }
    
    /// ProjectName
    public static var projectName: String {

        return (Bundle.main.infoDictionary?["CFBundleExecutable"] as? String) ?? "N/V"
    }
    
    /// Version
    public static var version: String {
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "N/V"
    }
    
    /// Build
    public static var build: String {
        return (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? "N/V"
    }
    
    /// BundleId
    public static var bundleId: String {
        return (Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String) ?? "N/V"
    }
}


extension ZeroXmas where Base: UIImage {
    public static var navBackImage: UIImage? {
        if let name = Bundle.zx.navBackImageNameStr {
            return UIImage(contentsOfFile: name)
        }
        return nil
    }
}
