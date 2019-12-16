//
//  SecurityMiddleware.swift
//  App
//
//  Created by Ravneet Singh on 4/9/19.
//

import Vapor
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
  
  func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
    guard let bearer = request.headers.bearerAuthorization else {
      return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
    }
    if bearer.token != "Secret" {
      return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
    }
    request.auth.login(SampleAuthType(securedBy: .security1, secret: bearer.token))
    return next.respond(to: request)
  }
}
