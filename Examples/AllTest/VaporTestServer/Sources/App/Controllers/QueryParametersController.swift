//
//  QueryParsingController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class QueryParametersController: QueryParametersApiDelegate {
  typealias AuthType = SampleAuthType

  func queryParameters(with req: Request, param1: String, param2: Int?) throws -> EventLoopFuture<queryParametersResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(QueryParametersResponse(param1: param1, param2: param2)))
  }
}
