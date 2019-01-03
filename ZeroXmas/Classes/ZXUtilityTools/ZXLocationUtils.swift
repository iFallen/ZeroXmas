//
//  ZXLocationUtils.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2019/1/2.
//  Copyright © 2019 screson. All rights reserved.
//

import UIKit
import CoreLocation

public enum ZXCheckLocationStatus: CustomStringConvertible {
    case success,lastTimeNotEnd,disable
    case notDetermined
    case restricted
    case denied
    case failed
    
    public var description: String {
        switch self {
        case .success:
            return "成功"
        case .lastTimeNotEnd:
            return "上一次调用未结束,请稍后再试..."
        case .disable:
            return "设备定位服务不可用"
        case .notDetermined:
            return "未作出授权选择"
        case .restricted:
            return "该功能被禁用"
        case .denied:
            return "阻止了位置访问权限"
        case .failed:
            return "获取位置信息失败"
        }
    }
}

public typealias ZXCheckLocation = (ZXCheckLocationStatus,CLLocation?) -> Void

public class ZXLocationUtils: NSObject,CLLocationManagerDelegate {
    
    private var checkEnd: ZXCheckLocation?
    public var located:  Bool = false
    public var locating: Bool = false
    public var manager:  CLLocationManager?
    
    public static let shareInstance = ZXLocationUtils()
    
    public override init() {
        super.init()
        self.manager = CLLocationManager()
        self.manager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.manager?.requestWhenInUseAuthorization()
        self.manager?.delegate = self
    }
    
    public func checkCurrentLocation(completion:ZXCheckLocation?) {
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            if status == .authorizedAlways || status == .authorizedWhenInUse || status == .notDetermined {
                if locating {
                    completion?(.lastTimeNotEnd,nil)
                    return
                } else {
                    located = false
                }
                self.checkEnd = completion
                self.manager?.startUpdatingLocation()
                locating = true
            } else {
                switch status {
                case .restricted:
                    completion?(.restricted,nil)
                case .denied:
                    completion?(.denied,nil)
                default:
                    break
                }
            }
        } else {
            completion?(.disable,nil)
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.checkEnd?(.failed,nil)
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if located {
            return
        }
        located = true
        locating = false
        manager.stopUpdatingLocation()
        self.checkEnd?(.success,locations.last)
    }
}

