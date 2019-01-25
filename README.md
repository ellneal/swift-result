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


##### EmptyResult

Empty result is useful when there's no corresponding value for a successful result.

```swift
let success: EmptyResult<CustomError> = .success

// syntactic sugar for let success: Result<Void, CustomError> = .value(())
```

##### InfallibleResult

An `InfallibleResult<Value>` can never be in error (`Result<Value, Never>`).

##### ErroneousResult

An `ErroneousResult<Error>` can never have a value (`Result<Never, Error>`).
