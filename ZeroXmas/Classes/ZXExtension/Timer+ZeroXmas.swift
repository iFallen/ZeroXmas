//
//  Timer+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/28.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation

extension ZeroXmas where Base: Timer {
    static func scheduledTimer (timeInterval: TimeInterval,
                                repeats: Bool,
                                completion:@escaping ((_ timer:Timer)->())) -> Timer{
        
        return Timer.scheduledTimer(timeInterval: timeInterval,
                                    target: Timer.self,
            selector: #selector(Timer.completionLoop(timer:)),
            userInfo: completion, repeats: repeats)
    }
}

extension Timer {
    @objc static func completionLoop(timer:Timer) {
        guard let completion = timer.userInfo as? ((Timer) -> ()) else {
            return
        }
        completion(timer)
    }
}
