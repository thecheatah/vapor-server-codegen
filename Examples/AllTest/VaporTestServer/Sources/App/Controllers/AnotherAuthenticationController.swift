//
//  AnotherAuthenticationController.swift
//  App
//
//  Created by Ravneet Singh on 4/18/19.
//

import Vapor
import VaporTestInterface

class AnotherAuthenticationController: AnotherAuthenticationApiDelegate {
  typealias AuthType = SampleAuthType

  func anotherApiAnotherSecurityProtectedEndpoint(with req: Request, asAuthenticated user: SampleAuthType) throws -> EventLoopFuture<anotherApiAnotherSecurityProtectedEndpointResponse> {
    return req.future(.http200(SecurityProtectedEndpointResponse(secret: user.secret, securedBy: user.securedBy)))
  }
  
  func anotherApiSecurityProtectedEndpoint(with req: Request, asAuthenticated user: SampleAuthType) throws -> EventLoopFuture<anotherApiSecurityProtectedEndpointResponse> {
    return req.future(.http200(SecurityProtectedEndpointResponse(secret: user.secret, securedBy: user.securedBy)))
  }
}
