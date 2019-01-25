public enum Result<Success, Failure: Swift.Error> {
    case success(Success)
    case failure(Failure)
}

extension Result {
    @discardableResult public func resolve() throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

extension Result: Equatable where Success: Equatable, Failure: Equatable { }
extension Result: Hashable where Success: Hashable, Failure: Hashable { }

extension Result: CustomStringConvertible where Success: CustomStringConvertible, Failure: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success(let value):
            return value.description
        case .failure(let error):
            return error.description
        }
    }
}

extension Result: CustomDebugStringConvertible where Success: CustomDebugStringConvertible,
Failure: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return value.debugDescription
        case .failure(let error):
            return error.debugDescription
        }
    }
}

extension Never: Error { }
public typealias InfallibleResult<Success> = Result<Success, Never>
public typealias ErroneousResult<Failure: Swift.Error> = Result<Never, Failure>
