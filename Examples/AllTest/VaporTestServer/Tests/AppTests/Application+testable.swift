//
//  Application+testable.swift
//  App
//
//  Created by Ravneet Singh on 3/28/19.
//

@testable import App
import Vapor
import XCTVapor

extension Application {
  static func testable() throws -> Application {
    let app = Application(.testing)
    try configure(app)
    return app
  }
}

extension XCTApplicationTester {
  
  @discardableResult
  public func test<Body>(
    _ method: HTTPMethod,
    _ path: String,
    headers: HTTPHeaders = [:],
    json: Body,
    file: StaticString = #file,
    line: UInt = #line,
    closure: (XCTHTTPResponse) throws -> () = { _ in }
  ) throws -> XCTApplicationTester
    where Body: Encodable
  {
    var body = ByteBufferAllocator().buffer(capacity: 0)
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    try body.writeBytes(encoder.encode(json))
    var realHeaders = headers
    // Allow caller to override the Content-Type for JSON.
    if !realHeaders.contains(name: .contentType) {
      realHeaders.add(name: .contentType, value: HTTPMediaType.json.serialize())
    }
    return try self.test(method, path, headers: realHeaders, body: body, closure: closure)
  }
  
  @discardableResult
  public func test<Body>(
    _ method: HTTPMethod,
    _ path: String,
    headers: HTTPHeaders = [:],
    form: Body,
    file: StaticString = #file,
    line: UInt = #line,
    closure: (XCTHTTPResponse) throws -> () = { _ in }
  ) throws -> XCTApplicationTester
    where Body: Encodable
  {
    var body = ByteBufferAllocator().buffer(capacity: 0)
    let encoder = URLEncodedFormEncoder()
    try body.writeBytes(encoder.encode(form).data(using: .utf8)!)
    var realHeaders = headers
    // Allow caller to override the Content-Type for JSON.
    if !realHeaders.contains(name: .contentType) {
      realHeaders.add(name: .contentType, value: HTTPMediaType.urlEncodedForm.serialize())
    }
    return try self.test(method, path, headers: realHeaders, body: body, closure: closure)
  }
}
