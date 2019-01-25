public typealias EmptyResult<Error: Swift.Error> = Result<Void, Error>

extension Result where Value == Void {
    @available(*, deprecated, renamed: "success")
    public static var value: Result {
        return .success
    }

    public static var success: Result {
        return .value(())
    }
}
