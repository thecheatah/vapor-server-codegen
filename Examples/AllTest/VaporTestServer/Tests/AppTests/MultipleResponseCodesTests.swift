@testable import App
import XCTVapor
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
    try app.test(.POST, "/multiple/response/codes", json: input, closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.created, "/multiple/response/codes did not return a 201")
      XCTAssertContent(SimpleObject.self, response) { (output: SimpleObject) in
        XCTAssertEqual(output.simpleString, "Simple String", "/multiple/response/codes simpleString was not of expected value: \"String Value\"")
        XCTAssertEqual(output.simpleArray[0], "Hi!", "/multiple/response/codes simpleArray[0] was not of expected value: \"Hi!\"")
      }
    })
  }

  func testMultipleResponseCodesWithoutPayload() throws {
    let input = MultipleResponseCodeRequest(responseCode: ._200)
    try app.test(.POST, "/multiple/response/codes", json: input, closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/multiple/response/codes did not return a 201")
      XCTAssertEqual(0, response.body.count, "/multiple/response/codes body should be empty")
    })
  }

  static let allTests = [
    ("testMultipleResponseCodesWithPayload", testMultipleResponseCodesWithPayload),
    ("testMultipleResponseCodesWithoutPayload", testMultipleResponseCodesWithoutPayload)
  ]
}
