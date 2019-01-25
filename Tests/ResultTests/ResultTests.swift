@testable import Result
import XCTest

class ResultTests: XCTestCase {
    typealias TestResult = Result<String, String>

    func testCustomStringConvertibleValue() {
        let value = "TheValue"
        let result = TestResult.value(value)
        XCTAssertEqual(result.description, value.description)
    }

    func testCustomStringConvertibleError() {
        let error = "TheError"
        let result = TestResult.error(error)
        XCTAssertEqual(result.description, error.description)
    }

    func testCustomDebugStringConvertibleValue() {
        let value = "TheValue"
        let result = TestResult.value(value)
        XCTAssertEqual(result.debugDescription, value.debugDescription)
    }

    func testCustomDebugStringConvertibleError() {
        let error = "TheError"
        let result = TestResult.error(error)
        XCTAssertEqual(result.debugDescription, error.debugDescription)
    }

    func testResolveValue() {
        let value = "TheValue"
        let result = TestResult.value(value)
        XCTAssertEqual(try result.resolve(), value)
    }

    func testResolveError() {
        let error = "TheError"
        let result = TestResult.error(error)
        XCTAssertThrowsError(try result.resolve())
    }
}

extension String: Error { }
