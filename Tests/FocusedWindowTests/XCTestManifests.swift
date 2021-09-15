import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FocusedWindowTests.allTests),
    ]
}
#endif
