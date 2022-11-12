//
//  IndirectlyEncodable.swift
//  
//
//  Created by p-x9 on 2022/11/12.
//  
//

import Foundation

public protocol IndirectlyEncodable {
    associatedtype Target: ObjectConvertiblyEncodable

    static var codableTypeName: String { get }

    func encodable() -> Target?
}

extension IndirectlyEncodable {
    public func encodable() -> Target? {
        guard let object = self as? Target.Target else { return nil }

        return .init(with: object)
    }
}

extension IndirectlyEncodable {
    public static var codableTypeName: String {
        String(reflecting: Target.self)
    }
}
