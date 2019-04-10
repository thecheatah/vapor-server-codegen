//
//  AuthenticationController.swift
//  App
//
//  Created by Ravneet Singh on 4/9/19.
//

import Vapor
import VaporTestInterface

class AuthenticationController: AuthenticationApiDelegate {
  func securityProtectedEndpoint(request: Request) throws -> EventLoopFuture<securityProtectedEndpointResponse> {
    return request.future(.http200)
  }
}
