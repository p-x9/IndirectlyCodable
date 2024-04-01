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

    func applyProperties(to target: Target)
    func reverseApplyProperties(with target: Target)

    func converted() -> Target?
}

extension IndirectlyEncodableModel {
    public static var targetTypeName: String {
        String(reflecting: Target.self)
    }

    public func reverseApplyProperties(with target: Target) {}
    public func applyProperties(to target: Target) {}
}
