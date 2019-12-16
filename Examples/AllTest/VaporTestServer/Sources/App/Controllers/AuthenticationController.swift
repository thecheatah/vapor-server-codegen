//
//  AuthenticationController.swift
//  App
//
//  Created by Ravneet Singh on 4/9/19.
//

import Vapor
import VaporTestInterface

class AuthenticationController: AuthenticationApiDelegate {
  typealias AuthType = SampleAuthType

  func securityProtectedEndpoint(with req: Request, asAuthenticated user: SampleAuthType) throws -> EventLoopFuture<securityProtectedEndpointResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(SecurityProtectedEndpointResponse(secret: user.secret, securedBy: user.securedBy)))
  }
  
  func anotherSecurityProtectedEndpoint(with req: Request, asAuthenticated user: SampleAuthType) throws -> EventLoopFuture<anotherSecurityProtectedEndpointResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(SecurityProtectedEndpointResponse(secret: user.secret, securedBy: user.securedBy)))
  }

}
