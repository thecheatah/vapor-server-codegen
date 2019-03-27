//
//  PathParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class PathParsingController: PathParsingApiDelegate {
    
    func multipleDepth() throws -> EventLoopFuture<HTTPStatus> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }

    func multipleParameter(param1: String, param2: Int) throws -> EventLoopFuture<HTTPStatus> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }

    func rootPath() throws -> EventLoopFuture<HTTPStatus> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }
    
    func singleDepth() throws -> EventLoopFuture<HTTPStatus> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }
    
    func singleParameter(parameter: Int) throws -> EventLoopFuture<HTTPStatus> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }
}


