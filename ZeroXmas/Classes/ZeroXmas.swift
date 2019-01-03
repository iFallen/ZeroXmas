//
//  ZeroXmas.swift
//  ZeroXmas
//
//  Created by JuanFelix on 2018/12/19.
//  Copyright © 2018 JuanFelix. All rights reserved.
//

public struct ZeroXmas<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ZeroXmasCompatible {
    associatedtype CompatibleType
    static var zx: ZeroXmas<CompatibleType>.Type { get set}
    var zx: ZeroXmas<CompatibleType> { get set }
}

extension ZeroXmasCompatible {
    ///ZeroXmas extensions.
    public static var zx: ZeroXmas<Self>.Type {
        get {
            return ZeroXmas<Self>.self
        }
        set { }
    }
    ///ZeroXmas extensions.
    public var zx: ZeroXmas<Self> {
        get {
            return ZeroXmas(self)
        }
        set { }
    }
}

import Foundation.NSObject
extension NSObject: ZeroXmasCompatible {}
