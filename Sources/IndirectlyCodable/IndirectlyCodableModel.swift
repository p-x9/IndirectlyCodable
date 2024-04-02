//
//  IndirectlyCodableModel.swift
//  
//
//  Created by p-x9 on 2022/11/12.
//  
//

import Foundation

public protocol IndirectlyCodableModel: IndirectlyEncodableModel, IndirectlyDecodableModel {}

extension IndirectlyCodableModel {
    public static var targetTypeName: String {
        String(reflecting: Target.self)
    }

    public func applyProperties(to target: inout Target) {}
    public func applyProperties(with target: Target) {}
}

extension IndirectlyCodableModel where Target: AnyObject {
    public func applyProperties(to target: Target) {
        var target = target
        applyProperties(to: &target)
    }
}
