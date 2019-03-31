import Vapor
import App
import XCTest
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
    let response = try app.sendRequest(to: "/", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/ did not return a 200")
    XCTAssertNil(response.http.body.data, "/ body should be nil")
  }
  
  func testSingleLevelPath() throws {
    let response = try app.sendRequest(to: "/path-single-depth", method: .GET, body: EmptyBody())
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/ did not return a 200")
    XCTAssertNil(response.http.body.data, "/ body should be nil")
  }
  
  func testMultipleLevelPath() throws {
    let response = try app.sendRequest(to: "/path/multiple/depth", method: .GET, body: EmptyBody())
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/path/multiple/depth did not return a 200")
    XCTAssertNil(response.http.body.data, "/path/multiple/depth body should be nil")
  }
  
  func testMultipleParameterPath() throws {
    let response = try app.sendRequest(to: "/path/String%20Value/and/44", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/path/test-parameter-value did not return a 200")
    XCTAssertNotNil(response.http.body.data, "/path/test-parameter-value should not be nil")
    let result = try! response.content.decode(MultipleParameterResponse.self).wait()
    XCTAssertEqual(result.param1, "String Value", "/path/{param1}/and/{param2} param1 was not of expected value: \"String Value\"")
    XCTAssertEqual(result.param2, "44", "/path/{param1}/and/{param2} param2 was not of expected value: \"44\"")
  }
  
  func testGetParameter() throws {
    let response = try app.sendRequest(to: "/path/test-parameter-value", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/path/test-parameter-value did not return a 200")
    XCTAssertNotNil(response.http.body.data, "/path/test-parameter-value should not be nil")
    XCTAssertEqual(String(bytes: response.http.body.data!, encoding: .utf8), "test-parameter-value", "/path/test-parameter-value returned payload should be \"test-parameter-value\"")
  }
  
  static let allTests = [
    ("testRootRequest", testRootRequest),
    ("testSingleLevelPath", testSingleLevelPath),
    ("testMultipleLevelPath", testMultipleLevelPath),
    ("testMultipleParameterPath", testMultipleParameterPath),
    ("testGetParameter", testGetParameter),
  ]
}
