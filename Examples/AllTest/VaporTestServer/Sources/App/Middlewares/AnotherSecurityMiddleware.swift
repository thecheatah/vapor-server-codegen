//
//  AnotherSecurityMiddleware.swift
//  App
//
//  Created by Ravneet Singh on 4/18/19.
//

import Vapor
import Authentication
import VaporTestInterface

class AnotherSecurityMiddleware: AuthenticationMiddleware {
  typealias AuthType = SampleAuthType
  
  func authType() -> SampleAuthType.Type {
    return SampleAuthType.self
  }
  
  func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
    guard let bearer = request.http.headers.bearerAuthorization else {
      throw Abort(.unauthorized)
    }
    if bearer.token != "Secret" {
      throw Abort(.unauthorized)
    }
    try request.authenticate(SampleAuthType(securedBy: .security2, secret: bearer.token))
    return try next.respond(to: request)
  }
}
