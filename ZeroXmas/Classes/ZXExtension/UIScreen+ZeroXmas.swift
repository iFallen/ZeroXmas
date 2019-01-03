//
//  UIScreen+ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/21.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

extension ZeroXmas where Base: UIScreen {
    public static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    public static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
