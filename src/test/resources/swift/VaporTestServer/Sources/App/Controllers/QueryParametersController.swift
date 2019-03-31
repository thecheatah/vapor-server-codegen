//
//  QueryParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class QueryParametersController: QueryParametersApiDelegate {
  func queryParameters(request: Request, param1: String, param2: Int?) throws -> EventLoopFuture<QueryParametersResponse> {
    return request.future(QueryParametersResponse(param1: param1, param2: param2))
  }
}
