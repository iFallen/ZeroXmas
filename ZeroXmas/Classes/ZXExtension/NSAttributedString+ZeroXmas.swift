//
//  NSAttributedString+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/29.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import UIKit

public enum ZXAttributedLineType {
    case underLine,deleteLine
}

extension ZeroXmas where Base: NSAttributedString {
    public static func addLine(to text:String,
                               type:ZXAttributedLineType,
                               at range:NSRange) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: text)
        switch type {
        case .deleteLine:
            attrString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        case .underLine:
            attrString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: range)
        }
        return attrString
    }
    
    
    public static func color(to text:String,
                                color:UIColor,
                                at range:NSRange) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: text)
        if range.length > 0 {
            attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        return attrString
    }
    
    
    public static func font(to text:String,
                               font:UIFont,
                               at range:NSRange) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: text)
        if range.length > 0 {
            attrString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        }
        return attrString
    }
}

extension NSMutableAttributedString {
    
    public func append(color:UIColor,at range:NSRange) {
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    public func appen(font:UIFont, at range:NSRange) {
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
