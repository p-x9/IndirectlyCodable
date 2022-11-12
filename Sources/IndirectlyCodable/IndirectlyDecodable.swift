//
//  IndirectlyDecodable.swift
//  
//
//  Created by p-x9 on 2022/11/12.
//  
//

import Foundation

public protocol IndirectlyDecodable {
    associatedtype Target: ObjectConvertiblyDecodable

    static var codableTypeName: String { get }

    func decodable() -> Target?
}

extension IndirectlyDecodable {
    public func decodable() -> Target? {
        guard let object = self as? Target.Target else { return nil }

        return .init(with: object)
    }
}

extension IndirectlyDecodable {
    public static var codableTypeName: String {
        String(reflecting: Target.self)
    }
}
