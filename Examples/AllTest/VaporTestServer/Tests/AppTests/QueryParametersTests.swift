import Vapor
import App
import XCTest
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
    let response = try app.sendRequest(to: "/query/parameter", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.badRequest, "/query/parameter did not return a 400")
    XCTAssertNotNil(response.http.body.data, "/query/parameter should not be nil")
  }
  
  func testQueryParameters() throws {
    let response = try app.sendRequest(to: "/query/parameter?param1=String%20Value&param2=44", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/query/parameter did not return a 200")
    XCTAssertNotNil(response.http.body.data, "/query/parameter should not be nil")
    let result = try! response.content.decode(QueryParametersResponse.self).wait()
    XCTAssertEqual(result.param1, "String Value", "/query/parameter param1 was not of expected value: \"String Value\"")
    XCTAssertEqual(result.param2, 44, "/query/parameter param2 was not of expected value: 44")
  }

  func testQueryOptionalParameters() throws {
    let response = try app.sendRequest(to: "/query/parameter?param1=String%20Value", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/query/parameter did not return a 200")
    XCTAssertNotNil(response.http.body.data, "/query/parameter should not be nil")
    let result = try! response.content.decode(QueryParametersResponse.self).wait()
    XCTAssertEqual(result.param1, "String Value", "/query/parameter param1 was not of expected value: \"String Value\"")
    XCTAssertEqual(result.param2, nil, "/query/parameter param2 was not of expected value: nil")
  }

  static let allTests = [
    ("testMissingParameter", testMissingParameter),
    ("testQueryParameters", testQueryParameters),
    ("testQueryOptionalParameters", testQueryOptionalParameters),
  ]
}
