//
//  AuthenticationTests.swift
//  AppTests
//
//  Created by Ravneet Singh on 4/10/19.
//

@testable import App
import XCTVapor
import VaporTestInterface

//https://medium.com/swift2go/vapor-3-series-iii-testing-b192be079c9e

final class AuthenticationTests: XCTestCase {

  var app: Application!

  override func setUp() {
    super.setUp()
    app = try! Application.testable()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testNoAuthentication() throws {
    try app.test(.GET, "/authentication/single") { (response: XCTHTTPResponse) in
      XCTAssertEqual(HTTPStatus.unauthorized, response.status, "/authentication/single did not return a 401")
    }
  }

  func testWithWrongAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Wrong Secret")
    try app.test(.GET, "/authentication/single", headers: headers, closure: { (response: XCTHTTPResponse) in
      XCTAssertEqual(response.status, HTTPStatus.unauthorized, "/authentication/single did not return a 401")
    })
  }

  func testWithCorrectAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Secret")
    try app.test(.GET, "/authentication/single", headers: headers) { (response: XCTHTTPResponse) in
      XCTAssertEqual(HTTPStatus.ok, response.status, "/authentication/single did not return a 200")
      XCTAssertContent(SecurityProtectedEndpointResponse.self, response) {
        XCTAssertEqual($0.secret, "Secret", "/authentication/single secret did not match")
        XCTAssertEqual($0.securedBy, SecurityProtectedEndpointResponse.SecuredBy.security1, "/authentication/single securedBy did not match")
      }
    }
  }

  func testWithAnotherSecurityMiddlewareCorrectAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Secret")
    try app.test(.GET, "/authentication/another", headers: headers) { (response: XCTHTTPResponse) in
      XCTAssertEqual(HTTPStatus.ok, response.status, "/authentication/another did not return a 200")
      XCTAssertContent(SecurityProtectedEndpointResponse.self, response) {
        XCTAssertEqual($0.secret, "Secret", "/authentication/another secret did not match")
        XCTAssertEqual($0.securedBy, SecurityProtectedEndpointResponse.SecuredBy.security2, "/authentication/another securedBy did not match")
      }
    }
  }

  func testAnotherApiWithCorrectAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Secret")
    try app.test(.GET, "/authentication-another/single", headers: headers) { (response: XCTHTTPResponse) in
      XCTAssertEqual(HTTPStatus.ok, response.status, "/authentication-another/single did not return a 200")
      XCTAssertContent(SecurityProtectedEndpointResponse.self, response) {
        XCTAssertEqual($0.secret, "Secret", "/authentication-another/single secret did not match")
        XCTAssertEqual($0.securedBy, SecurityProtectedEndpointResponse.SecuredBy.security1, "/authentication-another/single securedBy did not match")
      }
    }
  }

  func testAnotherApiWithAnotherSecurityMiddlewareCorrectAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Secret")
    try app.test(.GET, "/authentication-another/another", headers: headers) { (response: XCTHTTPResponse) in
      XCTAssertEqual(HTTPStatus.ok, response.status, "/authentication-another/another did not return a 200")
      XCTAssertContent(SecurityProtectedEndpointResponse.self, response) {
        XCTAssertEqual($0.secret, "Secret", "/authentication-another/another secret did not match")
        XCTAssertEqual($0.securedBy, SecurityProtectedEndpointResponse.SecuredBy.security2, "/authentication-another/another securedBy did not match")
      }
    }
  }

  static let allTests = [
    ("testNoAuthentication", testNoAuthentication),
    ("testWithWrongAuthentication", testWithWrongAuthentication),
    ("testWithCorrectAuthentication", testWithCorrectAuthentication),
    ("testWithAnotherSecurityMiddlewareCorrectAuthentication", testWithAnotherSecurityMiddlewareCorrectAuthentication),
    ("testAnotherApiWithCorrectAuthentication", testAnotherApiWithCorrectAuthentication),
    ("testAnotherApiWithAnotherSecurityMiddlewareCorrectAuthentication", testAnotherApiWithAnotherSecurityMiddlewareCorrectAuthentication),
  ]
}
