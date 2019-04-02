import Vapor
import App
import XCTest
import VaporTestInterface

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class HeadersTests: XCTestCase {
  
  var app: Application!
  
  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }
  
  override func tearDown() {
    super.tearDown()
  }

  func testMissingRequiredHeader() throws {
    let headers = HTTPHeaders()
    let response = try app.sendRequest(to: "/headers/in-request", method: .GET, headers: headers, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.badRequest, "/headers/in-request did not return a 400")
  }
  
  func testHeaderSetting() throws {
    var headers = HTTPHeaders()
    headers.add(name: "x-example-required-header", value: "Example Header")
    headers.add(name: "x-example-array-header", value: "Item 1")
    headers.add(name: "x-example-array-header", value: "Item 2")
    let response = try app.sendRequest(to: "/headers/in-request", method: .GET, headers: headers, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/headers/in-request did not return a 200")
    XCTAssertNotNil(response.http.body.data, "/headers/in-request should not be nil")
    let result = try! response.content.decode(RequestHeadersResponse.self).wait()
    XCTAssertEqual(result.requiredHeader, "Example Header", "/headers/in-request requiredHeader was not of expected value: \"Example Header\"")
    XCTAssertEqual(result.arrayHeader![0], "Item 1", "/headers/in-request arrayHeader![0] was not of expected value: \"Item 1\"")
    XCTAssertEqual(result.arrayHeader![1], "Item 2", "/headers/in-request arrayHeader![1] was not of expected value: \"Item 1\"")
  }

  func testOptionalHeaderSetting() throws {
    var headers = HTTPHeaders()
    headers.add(name: "x-example-required-header", value: "Example Header")
    let response = try app.sendRequest(to: "/headers/in-request", method: .GET, headers: headers, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/headers/in-request did not return a 200")
    XCTAssertNotNil(response.http.body.data, "/headers/in-request should not be nil")
    let result = try! response.content.decode(RequestHeadersResponse.self).wait()
    XCTAssertEqual(result.requiredHeader, "Example Header", "/headers/in-request requiredHeader was not of expected value: \"Example Header\"")
    XCTAssertEqual(result.arrayHeader!.count, 0, "/headers/in-request arrayHeader.count was not of expected value: 0")
  }
  
  static let allTests = [
    ("testHeaderSetting", testHeaderSetting),
    ("testOptionalHeaderSetting",  testOptionalHeaderSetting),
    ("testMissingRequiredHeader", testMissingRequiredHeader)
  ]
}
