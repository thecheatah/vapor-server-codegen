import Vapor
import App
import XCTest

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
    let response = try app.sendRequest(to: "/", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/ did not return a 200")
    XCTAssertNil(response.http.body.data, "/ body should be nil")
  }
  
  static let allTests = [
    ("testRootRequest", testRootRequest)
    
  ]
}
