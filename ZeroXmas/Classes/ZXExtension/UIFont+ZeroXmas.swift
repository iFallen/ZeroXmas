//
//  UIFont+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/24.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

extension ZeroXmas where Base: UIFont {
    /// TitleFont
    ///
    /// - Parameters:
    ///   - size: Default TitleFontSize
    ///   - fix: -n or  +n (means  TitleFontSize +/- n)
    /// - Returns: UIFont
    public static func titleFont(_ size:CGFloat = ZXFontConfig.titleFontSize,
                                 fix:CGFloat = 0) -> UIFont {
        return UIFont(name: ZXFontConfig.titleFontName, size: size + fix)!
    }
    /// BodyFont
    ///
    /// - Parameters:
    ///   - size: Default BodyFontSize
    ///   - fix: -n or  +n (means  BodyFontSize +/- n)
    /// - Returns: UIFont
    public static func bodyFont(_ size:CGFloat = ZXFontConfig.bodyFontSize,
                                fix:CGFloat = 0) -> UIFont {
        return UIFont(name: ZXFontConfig.bodyFontName, size: size + fix)!
    }
    /// MarkFont
    ///
    /// - Parameters:
    ///   - size: Default MarkFontSize
    ///   - fix: -n or  +n (means  MarkFontSize +/- n)
    /// - Returns: UIFont
    public static func markFont(_ size: CGFloat = ZXFontConfig.markFontSize,
                                fix: CGFloat = 0) -> UIFont {
        return UIFont(name: ZXFontConfig.markFontName, size: size + fix)!
    }
    /// IconFont
    ///
    /// - Parameters:
    ///   - size: CGFloat
    /// - Returns: UIFont
    public static func zx_iconFont(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: ZXFontConfig.iconFontName, size: size) else {
            fatalError("can not init iconfont")
        }
        return font
    }
}
