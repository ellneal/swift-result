# Result

A simple `Result<Value, Error: Swift.Error>` while we wait for Swift 5.

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
