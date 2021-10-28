import XCTest
@testable import Histograma

final class HistogramaTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Histograma(data: []).text, "Hello, World!")
    }
}
