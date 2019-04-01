//
//  PathParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class PathParsingController: PathParsingApiDelegate {
  
  func multipleDepth(request: Request) throws -> EventLoopFuture<multipleDepthResponse> {
    return request.future(multipleDepthResponse.http200())
  }
  
  func multipleParameter(request: Request, param1: String, param2: String) throws -> EventLoopFuture<multipleParameterResponse> {
    return request.future(.http200(MultipleParameterResponse(param1: param1, param2: param2)))
  }
  
  func rootPath(request: Request) throws -> EventLoopFuture<rootPathResponse> {
    return request.future(.http200())
  }
  
  func singleDepth(request: Request) throws -> EventLoopFuture<singleDepthResponse> {
    return request.future(.http200())
  }
  
  func singleParameter(request: Request, parameter: String) throws -> EventLoopFuture<singleParameterResponse> {
    return request.future(.http200(parameter))
  }
}


