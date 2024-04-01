//
//  IndirectlyDecodable.swift
//  
//
//  Created by p-x9 on 2022/11/12.
//  
//

import Foundation

public protocol IndirectlyDecodable {
    associatedtype Model: ObjectConvertiblyDecodable

    static var codableTypeName: String { get }

    func decodable() -> Model?
}

extension IndirectlyDecodable {
    public func decodable() -> Model? {
        guard let object = self as? Model.Target else { return nil }

        return .init(with: object)
    }
}

extension IndirectlyDecodable {
    public static var codableTypeName: String {
        String(reflecting: Model.self)
    }
}
