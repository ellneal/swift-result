public typealias EmptyResult<Error: Swift.Error> = Result<Void, Error>

extension Result where Value == Void {
    public static var value: Result {
        return .value(())
    }
}
