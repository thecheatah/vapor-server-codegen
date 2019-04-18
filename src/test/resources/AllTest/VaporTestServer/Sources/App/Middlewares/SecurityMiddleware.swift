//
//  SecurityMiddleware.swift
//  App
//
//  Created by Ravneet Singh on 4/9/19.
//

import Vapor
import Authentication
import VaporTestInterface

struct SampleAuthType: Authenticatable {
  let securedBy: SecurityProtectedEndpointResponse.SecuredBy
  let secret: String
}

class SecurityMiddleware: AuthenticationMiddleware {
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
    try request.authenticate(SampleAuthType(securedBy: .security1, secret: bearer.token))
    return try next.respond(to: request)
  }
}
