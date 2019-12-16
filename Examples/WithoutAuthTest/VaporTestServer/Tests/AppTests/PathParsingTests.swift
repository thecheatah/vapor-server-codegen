@testable import App
import XCTVapor
import VaporTestInterface

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class PathParsingTests: XCTestCase {
  
  var app: Application!
  
  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testRootRequest() throws {
    try app.test(.GET, "/", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/ did not return a 200")
      XCTAssertEqual(0, response.body.count, "Response body should be empty")
    })
  }
  
  func testSingleLevelPath() throws {
    try app.test(.GET, "/path-single-depth", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/ did not return a 200")
      XCTAssertEqual(0, response.body.count, "Response body should be empty")
    })
  }
  
  func testMultipleLevelPath() throws {
    try app.test(.GET, "/path/multiple/depth", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/ did not return a 200")
      XCTAssertEqual(0, response.body.count, "Response body should be empty")
    })
  }
  
  func testMultipleParameterPath() throws {
    try app.test(.GET, "/path/String%20Value/and/44", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/path/{param1}/and/{param2} did not return a 200")
      XCTAssertContent(MultipleParameterResponse.self, response) { (output: MultipleParameterResponse) in
        XCTAssertEqual(output.param1, "String Value", "/path/{param1}/and/{param2} param1 was not of expected value: \"String Value\"")
        XCTAssertEqual(output.param2, "44", "/path/{param1}/and/{param2} param2 was not of expected value: \"44\"")
      }
    })
  }
  
  func testGetParameter() throws {
    try app.test(.GET, "/path/test-parameter-value", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/path/test-parameter-value did not return a 200")
      XCTAssertEqual(String(bytes: response.body.data!, encoding: .utf8), "test-parameter-value", "/path/test-parameter-value returned payload should be \"test-parameter-value\"")
    })
  }
  
  static let allTests = [
    ("testRootRequest", testRootRequest),
    ("testSingleLevelPath", testSingleLevelPath),
    ("testMultipleLevelPath", testMultipleLevelPath),
    ("testMultipleParameterPath", testMultipleParameterPath),
    ("testGetParameter", testGetParameter),
  ]
}
