@testable import App
import XCTVapor
import VaporTestInterface

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class FormDataTests: XCTestCase {
  
  var app: Application!
  
  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  
  func testFormData() throws {
    let input = SimpleObject(simpleString: "Simple String", simpleNumber: 44.4, simpleInteger: 33, simpleDate: Date(), simpleEnumString: ._2, simpleBoolean: true, simpleArray: ["hello", "world"])
    
    try app.test(.POST, "/form/request", form: input) { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.ok, "/form/request did not return a 200")
      XCTAssertContent(SimpleObject.self, response) { (output: SimpleObject) in
        XCTAssertEqual(input.simpleString, output.simpleString, "/form/request simpleString did not match")
        XCTAssertEqual(input.simpleNumber, output.simpleNumber, "/form/request simpleNumber did not match")
        XCTAssertEqual(input.simpleInteger, output.simpleInteger, "/form/request simpleInteger did not match")
        //Data does not encode milliseconds so the date we sent in loses that information and cannot be compared
        let dateDifference = abs(input.simpleDate.timeIntervalSince(output.simpleDate))
        XCTAssert(dateDifference < 1.0, "/form/request simpleDate difference was more then 1 second")
        XCTAssertEqual(input.simpleEnumString, output.simpleEnumString, "/form/request simpleEnumString did not match")
        XCTAssertEqual(input.simpleBoolean, output.simpleBoolean, "/form/request simpleBoolean did not match")
        //This should compare the individual elements in the arrays as well
        XCTAssertEqual(input.simpleArray, output.simpleArray, "/form/request simpleArray did not match")
        XCTAssertEqual(input.simpleArray.count, output.simpleArray.count, "/form/request simpleArray.count did not match")
        XCTAssertEqual(input.simpleArray[0], output.simpleArray[0], "/form/request simpleArray[0] did not match")
        XCTAssertEqual(input.simpleArray[1], output.simpleArray[1], "/form/request simpleArray[1] did not match")
      }
    }
  }
  static let allTests = [
    ("testFormData", testFormData),
  ]
}
