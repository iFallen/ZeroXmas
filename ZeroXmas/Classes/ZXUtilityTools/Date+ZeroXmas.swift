//
//  Date+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2019/1/2.
//  Copyright © 2019 screson. All rights reserved.
//

import Foundation

extension Date: ZeroXmasCompatible {}

public enum ZXDateFormat {
    case date
    case time
    case dateTime
    case dateTimeWithSecond
    case timeWithSecond
    case custom(String)
    
    public func format(isCHN: Bool) -> String {
        switch self {
        case .date:
            if isCHN {
                return "YYYY年MM月dd日"
            } else {
                return "YYYY-MM-dd"
            }
        case .time:
            return "HH:mm"
        case .timeWithSecond:
            return "HH:mm:ss"

        case .dateTime:
            if isCHN {
                return "YYYY年MM月dd日 HH:mm"
            } else {
                return "YYYY-MM-dd HH:mm"
            }
        case .dateTimeWithSecond:
            if isCHN {
                return "YYYY年MM月dd日 HH:mm:ss"
            } else {
                return "YYYY-MM-dd HH:mm:ss"
            }
        case .custom(let format):
            return format
        }
    }
}

extension ZeroXmas where Base == Date {
    public struct Current {
        /// current Date&Time
        /// Beijing
        /// - Parameters:
        ///   - format: default dateTimeWithSecond, if custom, isCHN ignore
        ///   - isCHN: default true
        /// - Returns: -
        public static func date(format: ZXDateFormat = .dateTimeWithSecond,
                                isCHN: Bool = true) -> String {
            let formatter = DateFormatter()
            formatter.timeZone = Date.zx.CHNZONE()
            switch format {
            case .custom(let format):
                formatter.dateFormat = format
            default:
                formatter.dateFormat = format.format(isCHN: isCHN)
            }
            return formatter.string(from: Date())
        }
        /// Current MilliSecond
        ///
        /// - Returns: return value description
        public static func millisecond() -> Int64 {
            return Int64(Date().timeIntervalSince1970 * 1000)
        }
    }
    
    public static func CHNZONE() -> TimeZone {
        //return  NSTimeZone(name: "Asia/Beijing")
        return NSTimeZone(forSecondsFromGMT: +28800) as TimeZone
    }
    
    public struct millisecond {
        
        /// Millisecond to date
        ///
        /// - Parameters:
        ///   - millisecond: millisecond description
        ///   - format: default dateTimeWithSecond
        ///   - isCHN: default true
        /// - Returns: string
        public static func date(from millisecond:Int64,
                                to format: ZXDateFormat = .dateTimeWithSecond,
                                isCHN: Bool = true) -> String {
            let formatter = DateFormatter()
            formatter.timeZone = Date.zx.CHNZONE()
            switch format {
            case .custom(let f):
                formatter.dateFormat = f
            default:
                formatter.dateFormat = format.format(isCHN: isCHN)
            }
            return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(millisecond / 1000)))
        }
        
        /// Millisecond from date
        ///
        /// - Parameters:
        ///   - date: date description
        ///   - dateFormat: dateFormat description
        /// - Returns: return value description
        public static func from(_ date:String,
                                dateFormat:String!) -> Int64 {
            let formatter = DateFormatter()
            formatter.timeZone = Date.zx.CHNZONE()
            formatter.dateFormat = dateFormat
            if let date = formatter.date(from: date){
                return Int64(date.timeIntervalSince1970 * 1000)
            }
            return 0
        }
        
        /// Int To Time
        ///
        /// - Parameters:
        ///   - int: count
        ///   - c: component string
        /// - Returns: return value description
        public static func intToTime(_ int:TimeInterval,
                                     componentString c:String?) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            let date = Date(timeInterval: int, since: formatter.date(from: "00:00:00")!)
            if let c = c {
                formatter.dateFormat = "HH\(c)mm\(c)ss"
            }else{
                formatter.dateFormat = "HH°mm′ss″"
            }
            return formatter.string(from: date)
        }
    }
    
    
    /// StringValue
    ///
    /// - Parameters:
    ///   - format: default dateTimeWithSecond
    ///   - isCHN: default true
    /// - Returns: String
    public func stringValue(format: ZXDateFormat = .dateTimeWithSecond,
                            isCHN: Bool = true) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Date.zx.CHNZONE()
        switch format {
        case .custom(let f):
            formatter.dateFormat = f
        default:
            formatter.dateFormat = format.format(isCHN: isCHN)
        }
        return formatter.string(from: base)
    }
}
