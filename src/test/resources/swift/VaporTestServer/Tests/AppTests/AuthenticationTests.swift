//
//  AuthenticationTests.swift
//  AppTests
//
//  Created by Ravneet Singh on 4/10/19.
//

import Vapor
import App
import XCTest
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
    let response = try app.sendRequest(to: "/authentication/single", method: .GET, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.unauthorized, "/authentication/single did not return a 401")
  }
  
  func testWithWrongAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Wrong Secret")
    let response = try app.sendRequest(to: "/authentication/single", method: .GET, headers: headers, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.unauthorized, "/authentication/single did not return a 401")
  }
  
  func testWithCorrectAuthentication() throws {
    var headers = HTTPHeaders()
    headers.bearerAuthorization = BearerAuthorization(token: "Secret")
    let response = try app.sendRequest(to: "/authentication/single", method: .GET, headers: headers, body: EmptyBody()) as Response
    XCTAssertEqual(response.http.status, HTTPStatus.ok, "/authentication/single did not return a 200")
    let output = try! response.content.decode(SecurityProtectedEndpointResponse.self).wait()
    XCTAssertEqual(output.secret, "Secret", "/authentication/single secret did not match")
  }

  static let allTests = [
    ("testNoAuthentication", testNoAuthentication),
    ("testWithWrongAuthentication", testWithWrongAuthentication),
    ("testWithCorrectAuthentication", testWithCorrectAuthentication),
  ]
}
