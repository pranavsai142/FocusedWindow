import XCTest
@testable import FocusedWindow

final class FocusedWindowTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FocusedWindow().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
