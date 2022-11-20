# IndirectlyCodable

Protocol for indirect `Codable`(`Encodable`, `Decodable`) conformance

## Document
### IndirectlyCodable
#### Target
Direct `Codable` conforming type aliases.
Must conform to `ObjectConvertiblyCodable` described below.
```swift
typealias Target = CALayerModel
```

#### codable()
Get a `Codable` object.

#### codableTypeName
When making a class conform to this protocol, it is not possible to create additional aliases to the `Target` type in the inherited class.
Therefore, you must use this property to get the class with `NSClassFromString`.
```swift
@objc
public class var codableTypeName: String {
    String(reflecting: Target.self)
}
```

### ObjectConvertiblyCodable
#### Target
Alias of the type to be represented
```swift
typealias Target = CALayer
```
#### applyProperties to Target
Apply the value of a property of confidence to the target object.
Using this library named [p-x9/KeyPathValue](https://github.com/p-x9/KeyPathValue), you can create a propertyMap as follows.
```swift
let propertyMap: [PartialKeyPath<CALayerModel>: ReferenceWritableKeyPathValueApplier<CALayer>] = [
        \.bounds: .init(\.bounds),
         \.position: .init(\.position),
         \.frame: .init(\.frame),
         \.backgroundColor: .init(\.backgroundColor),
         \.cornerRadius: .init(\.cornerRadius),
         \.borderWidth: .init(\.borderWidth),
         \.borderColor: .init(\.borderColor)
    ]

func applyProperties(to target: CALayer) {
    Self.propertyMap.forEach { keyPath, applier in
        var value = self[keyPath: keyPath]
        if let convertible = value as? (any ObjectConvertiblyCodable),
            let converted = convertible.converted() {
            value = converted
        }
        applier.apply(value, target)
    }
}
```

#### reverseApplyProperties with Target
Apply values from the target object to its own properties.
