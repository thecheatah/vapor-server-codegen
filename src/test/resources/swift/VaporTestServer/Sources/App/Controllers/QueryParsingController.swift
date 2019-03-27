//
//  QueryParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class QueryParsingController: QueryParsingApiDelegate {
    func queryParsing(param1: String, param2: Int?) throws -> EventLoopFuture<HTTPStatus> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }
}
