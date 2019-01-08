//
//  ZXCommonUtils.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2019/1/2.
//  Copyright © 2019 screson. All rights reserved.
//

import UIKit
import AudioToolbox


public enum ZXURLCallStatus: CustomStringConvertible {
    case invalid
    case cantOpen
    
    public var description: String {
        switch self {
        case .invalid:
            return "URL无效"
        case .cantOpen:
            return "无法打开"
        }
    }
}

public typealias ZXFaildCallBack = (_ status: ZXURLCallStatus) -> Void

extension URL: ZeroXmasCompatible {}

// MARK: - OpenURL
extension ZeroXmas where Base == URL {
    public static func openURL(_ urlstr:String,
                               failedCallBack:ZXFaildCallBack?) {
        if let url = URL(string: urlstr) {
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            } else {
                failedCallBack?(.cantOpen)
            }
        } else {
            failedCallBack?(.invalid)
        }
    }
    
    public static func call(_ tel:String,
                            failedCallBack:ZXFaildCallBack?) {
        self.openURL("tel://\(tel)") { (s) in
            failedCallBack?(s)
        }
    }
}


// MARK: - UIPasteboard
extension ZeroXmas where Base: UIPasteboard {
    public static var value: String {
        let pasteBoard = UIPasteboard.general
        return pasteBoard.string ?? ""
    }
    
    public static func copyText(_ text: String) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = text
    }
}


/// ZXAudioUtils
public class ZXAudioUtils: NSObject {
    
    /// Play audio file
    ///
    /// - Parameters:
    ///   - resouce: name
    ///   - type: type eg.caf mp3...
    public class func play(forResource resouce:String?,
                           ofType type:String?) {
        if let file = Bundle.main.path(forResource: resouce, ofType: type) {
            var soundId: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(URL.init(fileURLWithPath: file) as CFURL, &soundId)
            self.play(withId: soundId)
        }
    }
    
    /// Play SystemSoundID
    ///
    /// - Parameter id: SystemSoundID
    public class func play(withId id: SystemSoundID) {
        AudioServicesPlaySystemSound(id)
    }
    
    
    /// vibrate
    public class func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    
    
}
