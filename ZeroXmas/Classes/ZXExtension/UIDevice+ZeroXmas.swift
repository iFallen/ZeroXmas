//
//  UIDevice+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/24.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import UIKit

public enum ZXDeviceSizeType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .s4_0:
            return "<= 4.0"
        case .s4_7:
            return "4.7(iPhone 6/7/8)"
        case .s5_5:
            return "5.5(iPhone 6P/7P/8P)"
        case .s5_8:
            return "5.8(iPhone X/XS)"
        case .s6_x:
            return "6.1/6.5(iPhone XR/XS Max)"
        case .iPad:
            return "iPad"
        }
    }
    case s4_0, s4_7, s5_5, s5_8, s6_x, iPad
}

extension ZeroXmas where Base: UIDevice {
    public static var isPhone: Bool {
        return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
    }
    
    public static var isPad: Bool {
        return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
    }
    
    public static var type: ZXDeviceSizeType {
        if self.isPhone {
            let length = max(UIScreen.zx.width, UIScreen.zx.height)
            if length <= 568.0 {
                return ZXDeviceSizeType.s4_0
            } else if length <= 667 {
                return ZXDeviceSizeType.s4_7
            } else if length <= 812 {
                return ZXDeviceSizeType.s5_8
            } else if length <= 896 {
                return ZXDeviceSizeType.s6_x
            } else {
                return ZXDeviceSizeType.s6_x
            }
        } else {
            return ZXDeviceSizeType.iPad
        }
    }
    
    public static var isX: Bool {
        if self.isPhone {
            let length = max(UIScreen.zx.width, UIScreen.zx.height)
            if length >= 812 {
                return true
            }
        }
        return false
    }
}
