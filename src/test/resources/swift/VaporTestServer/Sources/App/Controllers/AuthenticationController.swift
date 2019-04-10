//
//  AuthenticationController.swift
//  App
//
//  Created by Ravneet Singh on 4/9/19.
//

import Vapor
import VaporTestInterface

class AuthenticationController: AuthenticationApiDelegate {
  func securityProtectedEndpoint(with req: Request) throws -> EventLoopFuture<securityProtectedEndpointResponse> {
    return req.future(.http200)
  }
}
