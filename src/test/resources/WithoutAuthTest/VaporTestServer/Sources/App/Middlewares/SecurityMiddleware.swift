//
//  SecurityMiddleware.swift
//  App
//
//  Created by Ravneet Singh on 4/9/19.
//

import Vapor

class SecurityMiddleware: Middleware {
  func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
    guard let bearer = request.http.headers.bearerAuthorization else {
      throw Abort(.unauthorized)
    }
    if bearer.token != "Secret" {
      throw Abort(.unauthorized)
    }
    return try next.respond(to: request)
  }
}
