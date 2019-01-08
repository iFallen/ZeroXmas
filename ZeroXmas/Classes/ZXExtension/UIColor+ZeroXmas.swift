//
//  UIColor+zx.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/21.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import UIKit

extension ZeroXmas where Base: UIColor {
    
    public static func rgb(_ r: CGFloat,
                           _ g: CGFloat,
                           _ b: CGFloat,
                           _ a: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }

    /// Color With HEX
    public static func hex(_ hex:Int32, alpha: CGFloat = 1.0) -> UIColor {
        return rgb(((CGFloat)((hex & 0xFF0000) >> 16)),
                   ((CGFloat)((hex & 0xFF00) >> 8)),
                   ((CGFloat)(hex & 0xFF)),
                   alpha)
    }
    
    /// Color With HEX String
    public static func hexStr(_ str: String) -> UIColor {
        var cString: String = str.trimmingCharacters(in: .newlines).uppercased()
        if cString.hasPrefix("0x") || cString.hasPrefix("0X") {
            cString = cString.subs(from: 2)
        }
        if (cString.hasPrefix("#")) {
            cString = cString.subs(from: 1)
        }

        if (cString.count != 6) {
            return UIColor.clear
        }
        let rString = cString.subs(to: 2)
        let gString = cString.subs(with: 2..<4)
        let bString = cString.subs(with: 4..<6)

        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        return rgb(CGFloat(r), CGFloat(g), CGFloat(b), CGFloat(1))
    }

}

//MARK: - Tint Color
extension ZeroXmas where Base: UIColor {
    public static var tint: UIColor {
        return hexStr(ZXTintColorConfig.tintColorStr)
    }
    
    public static var subTint: UIColor {
        return hexStr(ZXTintColorConfig.subTintColorStr)
    }
    
    public static var background: UIColor {
        return hexStr(ZXTintColorConfig.backgroundColorStr)
    }
    
    public static var border: UIColor {
        return hexStr(ZXTintColorConfig.borderColorStr)
    }
    
    public static var empty: UIColor {
        return hexStr(ZXTintColorConfig.emptyColorStr)
    }
    
    public static var customA: UIColor {
        return hexStr(ZXTintColorConfig.customAColorStr)
    }
    
    public static var customB: UIColor {
        return hexStr(ZXTintColorConfig.customBColorStr)
    }
    
    public static var customC: UIColor {
        return hexStr(ZXTintColorConfig.customCColorStr)
    }
}

//MARK: - Text Color
extension ZeroXmas where Base: UIColor {
    public static var title: UIColor {
        return hexStr(ZXFontConfig.titleColorStr)
    }
    
    public static var body: UIColor {
        return hexStr(ZXFontConfig.bodyColorStr)
    }
    
    public static var mark: UIColor {
        return hexStr(ZXFontConfig.markColorStr)
    }
}

//MARK: - NavBar TabBar
extension ZeroXmas where Base: UIColor {
    public struct navBar {
        public static var background: UIColor {
            return ZXNavBarConfig.backgroundColor
        }
        
        public static var title: UIColor {
            return ZXNavBarConfig.titleColor
        }
        
        public static var buttonText: UIColor {
            return ZXNavBarConfig.buttonTextColor
        }
    }
    
    public struct tabBar {
        public static var background: UIColor {
            return ZXTabBarConfig.backgroundColor
        }
        
        public static var normal: UIColor {
            return ZXTabBarConfig.normalColor
        }
        
        public static var selected: UIColor {
            return ZXTabBarConfig.selectedColor
        }
    }
}
