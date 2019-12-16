@testable import App
import XCTVapor
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
    try app.test(.GET, "/headers/in-request", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.badRequest, "/headers/in-request did not return a 400")
    })
  }

  func testHeaderSetting() throws {
    var headers = HTTPHeaders()
    headers.add(name: "x-example-required-header", value: "Example Header")
    headers.add(name: "x-example-array-header", value: "Item 1")
    headers.add(name: "x-example-array-header", value: "Item 2")
    
    try app.test(.GET, "/headers/in-request", headers: headers, closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/headers/in-request did not return a 200")
      XCTAssertContent(RequestHeadersResponse.self, response) { (output: RequestHeadersResponse) in
        XCTAssertEqual(output.requiredHeader, "Example Header", "/headers/in-request requiredHeader was not of expected value: \"Example Header\"")
        XCTAssertEqual(output.arrayHeader![0], "Item 1", "/headers/in-request arrayHeader![0] was not of expected value: \"Item 1\"")
        XCTAssertEqual(output.arrayHeader![1], "Item 2", "/headers/in-request arrayHeader![1] was not of expected value: \"Item 1\"")
      }
    })
  }

  func testOptionalHeaderSetting() throws {
    var headers = HTTPHeaders()
    headers.add(name: "x-example-required-header", value: "Example Header")

    try app.test(.GET, "/headers/in-request", headers: headers, closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/headers/in-request did not return a 200")
      XCTAssertContent(RequestHeadersResponse.self, response) { (output: RequestHeadersResponse) in
        XCTAssertEqual(output.requiredHeader, "Example Header", "/headers/in-request requiredHeader was not of expected value: \"Example Header\"")
        XCTAssertEqual(output.arrayHeader!.count, 0, "/headers/in-request arrayHeader.count was not of expected value: 0")
      }
    })
  }

  func testResponseHeader() throws {
    try app.test(.GET, "/headers/in-response", closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.seeOther, "/headers/in-response did not return a 303")
      XCTAssertEqual(response.headers["location"][0], "https://chckt.com/login", "/headers/in-response did not return a location header with value: https://chckt.com/login")
    })
  }

  static let allTests = [
    ("testHeaderSetting", testHeaderSetting),
    ("testOptionalHeaderSetting",  testOptionalHeaderSetting),
    ("testMissingRequiredHeader", testMissingRequiredHeader),
    ("testResponseHeader", testResponseHeader)
  ]
}
