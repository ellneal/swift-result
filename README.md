# Result

A simple `Result<Success, Failure: Swift.Error>` while we wait for Swift 5.

### Installation

##### SwiftPM

```swift
...
    dependencies: [
        .package(url: "https://github.com/ellneal/swift-result", from: "2.0.0"),
    ]
...
```

##### Carthage

```
github "ellneal/swift-result" ~> 2.0.0
```

### Usage

```swift
enum CustomError: Swift.Error {
    case someError
}

let value: Result<String, CustomError> = .success("Value")
try {
    let string = try value.resolve()
    print(string) // prints "Value"
} catch {
    // won't throw
}

let error: Result<String, CustomError> = .failure(.someError)
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

// syntactic sugar for let success: Result<Void, CustomError> = .success(())
```

##### InfallibleResult

An `InfallibleResult<Success>` can never be in error (`Result<Success, Never>`).

##### ErroneousResult

An `ErroneousResult<Failure>` can never have a value (`Result<Never, Failure>`).
