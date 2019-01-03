//
//  ZXFontConfig.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/24.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import UIKit

public class ZXFontConfig: ZXConfigProtocol {
    
    static var configDic: Dictionary<String, Any>?
    static var shareInstance: Dictionary<String, Any> {
        guard let config = configDic else {
            configDic = ((NSDictionary(contentsOfFile: Bundle.zx.fontConfigPath)) as! Dictionary<String, Any>)
            return configDic!
        }
        return config
    }

    //MARK: -
    public static var titleColorStr: String {
        return stringValue(for: "titleColor", defaultValue: "#000000")
    }

    public static var bodyColorStr: String {
        return stringValue(for: "bodyColor", defaultValue: "#3b3e43")
    }
    
    public static var markColorStr: String {
        return stringValue(for: "markColor", defaultValue: "#9fa4ac")
    }
    
    public static var titleFontName: String {
        return stringValue(for: "titleFontName", defaultValue: "Arial")
    }
    
    public static var bodyFontName: String {
        return stringValue(for: "bodyFontName", defaultValue: "Arial")
    }
    
    public static var markFontName: String {
        return stringValue(for: "markFontName", defaultValue: "Arial")
    }
    
    public static var iconFontName: String {
        return stringValue(for: "iconFontName", defaultValue: "iconfont")
    }
    
    public static var titleFontSize: CGFloat {
        return fontSizeValue(for: "titleFontSize", defaultSize: 15)
    }
    
    public static var bodyFontSize: CGFloat {
        return fontSizeValue(for: "bodyFontSize", defaultSize: 13)
    }
    
    public static var markFontSize: CGFloat {
        return fontSizeValue(for: "markFontSize", defaultSize: 10)
    }
}
