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
    throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
  }
  
  func multipleParameter(request: Request, param1: String, param2: Int) throws -> EventLoopFuture<HTTPStatus> {
    throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
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


