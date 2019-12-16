@testable import App
import XCTVapor
import VaporTestInterface

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class QueryParametersTests: XCTestCase {
  
  var app: Application!
  
  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testMissingParameter() throws {
    try app.test(.GET, "/query/parameter", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.badRequest, "/query/parameter did not return a 400")
      XCTAssertNotEqual(0, response.body.count, "/query/parameter body should not be nil")
    })
  }
  
  func testQueryParameters() throws {
    try app.test(.GET, "/query/parameter?param1=String%20Value&param2=44", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/query/parameter did not return a 200")
      XCTAssertContent(QueryParametersResponse.self, response) { (result: QueryParametersResponse) in
        XCTAssertEqual(result.param1, "String Value", "/query/parameter param1 was not of expected value: \"String Value\"")
        XCTAssertEqual(result.param2, 44, "/query/parameter param2 was not of expected value: 44")
      }
    })
  }
  
  func testQueryOptionalParameters() throws {
    try app.test(.GET, "/query/parameter?param1=String%20Value", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/query/parameter did not return a 200")
      XCTAssertContent(QueryParametersResponse.self, response) { (result: QueryParametersResponse) in
        XCTAssertEqual(result.param1, "String Value", "/query/parameter param1 was not of expected value: \"String Value\"")
        XCTAssertEqual(result.param2, nil, "/query/parameter param2 was not of expected value: nil")
      }
    })
  }
  
  static let allTests = [
    ("testMissingParameter", testMissingParameter),
    ("testQueryParameters", testQueryParameters),
    ("testQueryOptionalParameters", testQueryOptionalParameters),
  ]
}
