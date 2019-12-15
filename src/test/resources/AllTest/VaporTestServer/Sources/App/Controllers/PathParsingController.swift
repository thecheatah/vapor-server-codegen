//
//  PathParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class PathParsingController: PathParsingApiDelegate {
  typealias AuthType = SampleAuthType

  func multipleDepth(with req: Request) throws -> EventLoopFuture<multipleDepthResponse> {
    return req.eventLoop.makeSucceededFuture(multipleDepthResponse.http200)
  }
  
  func multipleParameter(with req: Request, param1: String, param2: String) throws -> EventLoopFuture<multipleParameterResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(MultipleParameterResponse(param1: param1, param2: param2)))
  }
  
  func rootPath(with req: Request) throws -> EventLoopFuture<rootPathResponse> {
    return req.eventLoop.makeSucceededFuture(.http200)
  }
  
  func singleDepth(with req: Request) throws -> EventLoopFuture<singleDepthResponse> {
    return req.eventLoop.makeSucceededFuture(.http200)
  }
  
  func singleParameter(with req: Request, param1: String) throws -> EventLoopFuture<singleParameterResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(param1))
  }
}


