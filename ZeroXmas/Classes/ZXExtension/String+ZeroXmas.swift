//
//  String+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/24.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import UIKit

extension String {//扩展ZeroXmas，得到的Base为NSString?!
    
    public func index(at: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: at)
    }
    
    public func subs(from: Int) -> String {
        let fromIndex = index(at: from)
        return String(self[fromIndex..<self.endIndex])
    }
    
    public func subs(to: Int) -> String {
        let toIndex = index(at: to)
        return String(self[self.startIndex..<toIndex])
    }
    
    public func subs(with r:Range<Int>) -> String {
        let startIndex  = index(at: r.lowerBound)
        let endIndex    = index(at: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}


extension ZeroXmas where Base == String {
    
    /// MATCHES
    ///
    /// - Parameter string: -
    /// - Returns: -
    public func matchs(regular string:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@",string)
        return predicate.evaluate(with:self)
    }
    
    /// Rect
    ///
    /// - Parameters:
    ///   - font: -
    ///   - limiteSize: -
    /// - Returns: -
    public func rect(_ font:UIFont,
                     limiteSize:CGSize) -> CGSize {
        let size = (base as NSString).boundingRect(with: limiteSize,
                                                   options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue|NSStringDrawingOptions.truncatesLastVisibleLine.rawValue),
                                                   attributes: [NSAttributedString.Key.font: font],
                                                   context: nil).size
        return size
    }
    
    public var noticeName: NSNotification.Name {
        return NSNotification.Name.init(base)
    }
    
    public var telSecury: String {
        let head = base.subs(with: 0..<3)
        let tail = base.subs(with: (base.count - 4)..<base.count)
        return "\(head)****\(tail)"
    }
    

    /// Price format attributedString
    ///
    /// - Parameters:
    ///   - size: text size
    ///   - intSize: int size
    ///   - color: color
    ///   - fontName: font name
    /// - Returns: NSMutableAttributedString
    public func priceFormat(size:CGFloat,
                            intSize: CGFloat,
                            color: UIColor = .black,
                            fontName: String = ZXFontConfig.titleFontName) -> NSMutableAttributedString {
        let price = self.priceString()
        let aRange = NSMakeRange(0, price.count)//¥ + 小数部分
        var pRange = NSMakeRange(1, price.count)//整数部分
        
        let location = (price as NSString).range(of: ".")
        if  location.length > 0 {
            pRange = NSMakeRange(1, location.location)//整数部分
        }
        
        let formatPrice = NSAttributedString.zx.color(to: price, color: color, at: aRange)
        formatPrice.appen(font: UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size), at: aRange)
        formatPrice.appen(font:UIFont(name: fontName, size: intSize) ?? UIFont.systemFont(ofSize: intSize), at: pRange)
        return formatPrice
    }
    
    /// Price format attributedString
    ///
    /// - Parameter color: text color
    /// - Returns: NSMutableAttributedString
    public func priceFormat(color: UIColor?) -> NSMutableAttributedString {
        return self.priceFormat(size: 12, intSize: 15, color: color ?? UIColor.zx.title)
    }
    
    /// Price format string
    ///
    /// - Parameters:
    ///   - unit: is show unit
    ///   - currency: default ¥
    /// - Returns: String
    public func priceString(_ unit: Bool = true, currency:String = "¥") -> String {
        var price = base
        if price.count <= 0 {
            price = "0"
        }
        let location = (price as NSString).range(of: ".")
        if  location.length <= 0 {
            price += ".00"
        } else if (price.count - 1 - location.location) < 2 {
            price += "0"
        }
        price = price.replacingOccurrences(of: "(?<=\\d)(?=(\\d\\d\\d)+(?!\\d))", with: ",", options: .regularExpression, range: price.startIndex..<price.endIndex)
        if unit {
            if !price.hasPrefix(currency) {
                return "\(currency)\(price)"
            }
        } else {
            if price.hasPrefix(currency) {
                return price.subs(from: 1)
            }
        }
        return price
    }
    
    public func dateValue(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.timeZone = Date.zx.CHNZONE() as TimeZone?
        formatter.dateFormat = format
        return formatter.date(from: base)
    }

}

extension ZeroXmas where Base: NSNumber {
    public func zx_priceString(_ unit:Bool) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        var str = formatter.string(from: base) ?? "¥0.00"
        str = str.replacingOccurrences(of: "^[ a-zA-Z]*", with: "", options: .regularExpression, range: str.startIndex..<str.endIndex)
        str = str.replacingOccurrences(of: "$", with: "¥")
        if unit {
            return str
        } else {
            return str.subs(from: 1)
        }
    }
}

extension Dictionary: ZeroXmasCompatible {}
extension Array: ZeroXmasCompatible {}

extension ZeroXmas where Base == Dictionary<String, Any> {
    public var sortedJsonString: String {
        var tempDic = base
        var keys = Array<String>()
        for key in tempDic.keys {
            keys.append(key)
        }
        keys.sort { $0 < $1 }
        var signString = "{"
        var arr: Array<String> = []
        for key in keys {
            let value = tempDic[key]
            if let value = value as? Dictionary<String,Any> {
                arr.append("\"\(key)\":\(value.zx.sortedJsonString)")
            }else if let value = value as? Array<Any> {
                arr.append("\"\(key)\":\(value.zx.sortedJsonString)")
            }else{
                arr.append("\"\(key)\":\"\(tempDic[key]!)\"")
            }
        }
        signString += arr.joined(separator: ",")
        signString += "}"
        return signString
    }
}

extension ZeroXmas where Base == Array<Any> {
    public var sortedJsonString: String {
        let array = base
        var arr: Array<String> = []
        var signString = "["
        for value in array {
            if let value = value as? Dictionary<String,Any> {
                arr.append(value.zx.sortedJsonString)
            }else if let value = value as? Array<Any> {
                arr.append(value.zx.sortedJsonString)
            }else{
                arr.append("\"\(value)\"")
            }
        }
        arr.sort { $0 < $1 }
        signString += arr.joined(separator: ",")
        signString += "]"
        return signString
    }
}

