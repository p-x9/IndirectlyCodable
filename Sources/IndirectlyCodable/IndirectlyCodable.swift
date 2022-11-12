//
//  IndirectlyCodable.swift
//
//
//  Created by p-x9 on 2022/11/12.
//
//

import Foundation

public protocol IndirectlyCodable: IndirectlyEncodable, IndirectlyDecodable where Target: ObjectConvertiblyCodable {


    static var codableTypeName: String { get }

    func codable() -> Target?
}

extension IndirectlyCodable {
    public func codable() -> Target? {
        guard let object = self as? Target.Target else { return nil }

        return .init(with: object)
    }

    public func encodable() -> Target? {
        codable()
    }

    public func decodable() -> Target? {
        codable()
    }
}

extension IndirectlyCodable {
    public static var codableTypeName: String {
        String(reflecting: Target.self)
    }
}
