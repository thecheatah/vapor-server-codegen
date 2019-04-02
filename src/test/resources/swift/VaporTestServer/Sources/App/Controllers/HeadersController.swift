//
//  HeadersController.swift
//  App
//
//  Created by Ravneet Singh on 4/2/19.
//

import Vapor
import VaporTestInterface

class HeadersController: HeadersApiDelegate {
  func requestHeaders(request: Request, xExampleRequiredHeader: String, xExampleArrayHeader: [String]) throws -> EventLoopFuture<requestHeadersResponse> {
    return request.future(.http200(RequestHeadersResponse(requiredHeader: xExampleRequiredHeader, arrayHeader: xExampleArrayHeader)))
  }
}
