//
//  PathParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class PathParsingController: PathParsingApiDelegate {
  
  func multipleDepth(request: Request) throws -> EventLoopFuture<HTTPStatus> {
    return request.future(HTTPStatus.ok)
  }
  
  func multipleParameter(request: Request, param1: String, param2: String) throws -> EventLoopFuture<MultipleParameterResponse> {
    return request.future(MultipleParameterResponse(param1: param1, param2: param2))
  }
  
  func rootPath(request: Request) throws -> EventLoopFuture<HTTPStatus> {
    return request.future(HTTPStatus.ok)
  }
  
  func singleDepth(request: Request) throws -> EventLoopFuture<HTTPStatus> {
    return request.future(HTTPStatus.ok)
  }
  
  func singleParameter(request: Request, parameter: String) throws -> EventLoopFuture<String> {
    return request.future(parameter)
  }
}


