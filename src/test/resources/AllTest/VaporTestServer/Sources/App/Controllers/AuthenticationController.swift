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

  func securityProtectedEndpoint(with req: Request, as from: SampleAuthType) throws -> EventLoopFuture<securityProtectedEndpointResponse> {
    return req.future(.http200(SecurityProtectedEndpointResponse(secret: from.secret)))
  }
}
