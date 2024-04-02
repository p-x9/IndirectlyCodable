//
//  IndirectlyEncodableModel.swift
//  
//
//  Created by p-x9 on 2022/11/13.
//  
//

import Foundation

public protocol IndirectlyEncodableModel: Encodable {
    associatedtype Target

    static var targetTypeName: String { get }

    init(with target: Target)

    func applyProperties(to target: inout Target)
    func applyProperties(with target: Target)

    func converted() -> Target?
}

extension IndirectlyEncodableModel {
    public static var targetTypeName: String {
        String(reflecting: Target.self)
    }

    public func applyProperties(to target: inout Target) {}
    public func applyProperties(with target: Target) {}
}

extension IndirectlyEncodableModel where Target: AnyObject {
    public func applyProperties(to target: Target) {
        var target = target
        applyProperties(to: &target)
    }
}
