//
//  Application+testable.swift
//  App
//
//  Created by Ravneet Singh on 3/28/19.
//

@testable import App
import Vapor

extension Application {
  static func testable() throws -> Application {
    var config = Config.default()
    var services = Services.default()
    var env = Environment.testing
    try App.configure(&config, &env, &services)
    let app = try Application(config: config, environment: env, services: services)
    try App.boot(app)
    return app
  }

  func sendRequest<Body>(to path: String, method: HTTPMethod, headers: HTTPHeaders = .init(), body: Body?, bodyEncoding: MediaType = .json) throws -> Response where Body: Content {
    /*
    var headers = headers
    if isLoggedInRequest {
      let credentials = BasicAuthorization(username: "admin", password: "password")
      var tokenHeaders = HTTPHeaders()
      tokenHeaders.basicAuthorization = credentials
      let tokenBody: EmptyBody? = nil
      let tokenResponse = try sendRequest(to: "api/users/login", method: .POST, headers: tokenHeaders, body: tokenBody)
      let token = try tokenResponse.content.decode(Token.self).wait()
      headers.add(name: .authorization, value: "Bearer \(token.token)")
    }
    */
    let httpRequest = HTTPRequest(method: method, url: URL(string: path)!, headers: headers)
    let wrappedRequest = Request(http: httpRequest, using: self)
    if let body = body {
      try wrappedRequest.content.encode(body, as: bodyEncoding)
    }
    let responder = try make(Responder.self)
//    print(wrappedRequest)
    return try responder.respond(to: wrappedRequest).wait()
  }
}

struct EmptyBody: Content {}
