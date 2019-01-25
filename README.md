# Result

A simple `Result<Value, Error: Swift.Error>` while we wait for Swift 5.

### Installation

##### SwiftPM

```swift
...
    dependencies: [
        .package(url: "https://github.com/ellneal/swift-result", from: "1.1.0"),
    ]
...
```

##### Carthage

```
github "ellneal/swift-result" ~> 1.1.0
```

### Usage

```swift
enum CustomError: Swift.Error {
    case someError
}

let value: Result<String, CustomError> = .value("Value")
try {
    let string = try value.resolve()
    print(string) // prints "Value"
} catch {
    // won't throw
}

let error: Result<String, CustomError> = .error(.someError)
try {
    let never = try value.resolve()
} catch let error {
    print(error) // prints CustomError.someError
}
```
