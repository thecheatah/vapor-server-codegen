@testable import App
import XCTVapor

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class AppTests: XCTestCase {
  
  var app: Application!
  
  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testRootRequest() throws {
    try app.test(.GET, "/") { (response: XCTHTTPResponse) in
      XCTAssertEqual(HTTPStatus.ok, response.status, "/ did not return a 200")
      XCTAssertNil(response.body.data, "/ body should be nil")
      XCTAssertEqual(0, response.body.count, "/ body should be nil")
    }
  }
  
  static let allTests = [
    ("testRootRequest", testRootRequest)
    
  ]
}
