//
//  ZXConfigProtocol.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/21.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

protocol ZXConfigProtocol: class {
    static var configDic: Dictionary<String, Any>? { get set }
    static var shareInstance: Dictionary<String, Any> { get }
    static func stringValue(for key: String, defaultValue: String) -> String
    static func fontSizeValue(for key: String, defaultSize: CGFloat) -> CGFloat
    static func boolValue(for key: String, defaultValue: Bool) -> Bool
    static func active()
}

extension ZXConfigProtocol {
    
    static func stringValue(for key: String, defaultValue: String) -> String {
        guard let colorStr = shareInstance[key] as? String else { return defaultValue }
        return colorStr
    }
    
    static func fontSizeValue(for key: String, defaultSize: CGFloat) -> CGFloat {
        if let dicF = shareInstance[key] as? Dictionary<String, Any> {
            switch UIDevice.zx.type {
                case .s4_0:
                    return dicF["4_0"] as! CGFloat
                case .s4_7:
                    return dicF["4_7"] as! CGFloat
                case .s5_5, .s5_8:
                    return dicF["5_x"] as! CGFloat
                case .s6_x:
                    return dicF["6_x"] as! CGFloat
                case .iPad:
                    return dicF["6_x"] as! CGFloat
            }
        }
        return defaultSize
    }
    
    static func boolValue(for key: String, defaultValue: Bool) -> Bool {
        if let boolValue = shareInstance[key] as? Bool {
            return boolValue
        }
        return defaultValue
    }
    
    static func active() {
        
    }
}

public class ZXConfig {
    public static func loadUIConfig() {
        self.loadNavBarConfig()
        self.loadTabBarConfig()
    }
    public static func loadNavBarConfig() {
        ZXNavBarConfig.active()
    }
    public static func loadTabBarConfig() {
        ZXTabBarConfig.active()
    }
}
