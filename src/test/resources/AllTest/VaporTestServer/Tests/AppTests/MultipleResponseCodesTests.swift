import Vapor
import App
import XCTest
import VaporTestInterface

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class MultipleResponseCodesTests: XCTestCase {
  
  var app: Application!
  
  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testMultipleResponseCodesWithPayload() throws {
    let input = MultipleResponseCodeRequest(responseCode: ._201)
    let response = try app.sendRequest(to: "/multiple/response/codes", method: .POST, body: input) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.created, "/multiple/response/codes did not return a 201")
    XCTAssertNotNil(response.http.body.data, "/multiple/response/codes should not be nil")
    let result = try! response.content.decode(SimpleObject.self).wait()
    XCTAssertEqual(result.simpleString, "Simple String", "/multiple/response/codes simpleString was not of expected value: \"String Value\"")
    XCTAssertEqual(result.simpleArray[0], "Hi!", "/multiple/response/codes simpleArray[0] was not of expected value: \"Hi!\"")
  }

  func testMultipleResponseCodesWithoutPayload() throws {
    let input = MultipleResponseCodeRequest(responseCode: ._200)
    let response = try app.sendRequest(to: "/multiple/response/codes", method: .POST, body: input) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/multiple/response/codes did not return a 201")
    XCTAssertNil(response.http.body.data, "/multiple/response/codes should  be nil")
  }

  static let allTests = [
    ("testMultipleResponseCodesWithPayload", testMultipleResponseCodesWithPayload),
    ("testMultipleResponseCodesWithoutPayload", testMultipleResponseCodesWithoutPayload)
  ]
}
