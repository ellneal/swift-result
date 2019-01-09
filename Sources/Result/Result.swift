public enum Result<Value, Error: Swift.Error> {
    case value(Value)
    case error(Error)
}

extension Result {
    @discardableResult public func resolve() throws -> Value {
        switch self {
        case .value(let value):
            return value
        case .error(let error):
            throw error
        }
    }
}

extension Result: Equatable where Value: Equatable, Error: Equatable { }
extension Result: Hashable where Value: Hashable, Error: Hashable { }

extension Result: CustomStringConvertible where Value: CustomStringConvertible, Error: CustomStringConvertible {
    public var description: String {
        switch self {
        case .value(let value):
            return value.description
        case .error(let error):
            return error.description
        }
    }
}

extension Result: CustomDebugStringConvertible where Value: CustomDebugStringConvertible,
Error: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .value(let value):
            return value.debugDescription
        case .error(let error):
            return error.debugDescription
        }
    }
}

extension Never: Error { }
public typealias InfallibleResult<Value> = Result<Value, Never>
public typealias ErroneousResult<Error: Swift.Error> = Result<Never, Error>
