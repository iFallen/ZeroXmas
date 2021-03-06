//
//  ReuseableView+ZX.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/25.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

import Foundation
import UIKit

public protocol ReusableView: class {}
public protocol NibLoadableView: class {}

//extension ReusableView where Self: UIView {
//    public static var reuseIdentifier: String {
//        return String(describing: self)
//    }
//}
//
//extension ReusableView where Self: UIView {
//    public static var nibName: String {
//        return String(describing: self)
//    }
//}

extension ZeroXmas where Base: ReusableView {
    public static var reuseIdentifier: String {
        return String(describing: Base.self)
    }
}

extension ZeroXmas where Base: ReusableView {
    public static var nibName: String {
        return String(describing: Base.self)
    }
}

extension UITableViewCell: ReusableView, NibLoadableView {}
extension UICollectionViewCell: ReusableView, NibLoadableView {}
extension UITableViewHeaderFooterView: ReusableView, NibLoadableView {}
