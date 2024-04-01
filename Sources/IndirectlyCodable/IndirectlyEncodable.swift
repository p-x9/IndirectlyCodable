//
//  IndirectlyEncodable.swift
//  
//
//  Created by p-x9 on 2022/11/12.
//  
//

import Foundation

public protocol IndirectlyEncodable {
    associatedtype Model: ObjectConvertiblyEncodable

    static var codableTypeName: String { get }

    func encodable() -> Model?
}

extension IndirectlyEncodable {
    public func encodable() -> Model? {
        guard let object = self as? Model.Target else { return nil }

        return .init(with: object)
    }
}

extension IndirectlyEncodable {
    public static var codableTypeName: String {
        String(reflecting: Model.self)
    }
}
