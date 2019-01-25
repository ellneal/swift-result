public typealias EmptyResult<Error: Swift.Error> = Result<Void, Error>

extension Result where Success == Void {
    public static var success: Result {
        return .success(())
    }
}
