//
//  ZXTintColorConfig.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/21.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation

public class ZXTintColorConfig: ZXConfigProtocol {
    static let `default` = "#ff0000"
    ///Config Plist Instance
    static var configDic: Dictionary<String, Any>?
    static var shareInstance: Dictionary<String, Any> {
        guard let config = configDic else {
            configDic = ((NSDictionary(contentsOfFile: Bundle.zx.tintColorConfigPath)) as! Dictionary<String, Any>)
            return configDic!
        }
        return config
    }
    ///MARK : - 
    public static var tintColorStr: String {
        return stringValue(for: "tint", defaultValue: self.default)
    }
    
    public static var subTintColorStr: String {
        return stringValue(for: "subTint", defaultValue: self.default)
    }
    
    public class var backgroundColorStr: String! {
        return stringValue(for:"background", defaultValue: self.default)
    }
    
    public class var borderColorStr: String {
        return stringValue(for:"border", defaultValue: self.default)
    }
    
    public class var emptyColorStr: String {
        return stringValue(for:"empty", defaultValue: "#ffffff")
    }
    
    public class var customAColorStr: String {
        return stringValue(for:"customA", defaultValue: self.default)
    }
    
    public class var customBColorStr: String {
        return stringValue(for:"customB", defaultValue: self.default)
    }
    
    public class var customCColorStr: String {
        return stringValue(for:"customC", defaultValue: self.default)
    }

}

