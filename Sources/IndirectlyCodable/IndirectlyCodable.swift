//
//  IndirectlyCodable.swift
//
//
//  Created by p-x9 on 2022/11/12.
//
//

import Foundation

public protocol IndirectlyCodable: IndirectlyEncodable, IndirectlyDecodable where Model: IndirectlyCodableModel {

    static var codableTypeName: String { get }

    func codable() -> Model?
}

extension IndirectlyCodable {
    public func codable() -> Model? {
        guard let target = self as? Model.Target else { return nil }

        return .init(with: target)
    }

    public func encodable() -> Model? {
        codable()
    }

    public func decodable() -> Model? {
        codable()
    }
}

extension IndirectlyCodable {
    public static var codableTypeName: String {
        String(reflecting: Model.self)
    }
}
