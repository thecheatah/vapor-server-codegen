//
//  HeadersController.swift
//  App
//
//  Created by Ravneet Singh on 4/2/19.
//

import Vapor
import VaporTestInterface

class HeadersController: HeadersApiDelegate {
  typealias AuthType = DummyAuthType.Type

  func responseHeaders(with req: Request) throws -> EventLoopFuture<responseHeadersResponse> {
    return req.future(.http303(location: "https://chckt.com/login"))
  }
  
  func requestHeaders(with req: Request, xExampleRequiredHeader: String, xExampleArrayHeader: [String]) throws -> EventLoopFuture<requestHeadersResponse> {
    return req.future(.http200(RequestHeadersResponse(requiredHeader: xExampleRequiredHeader, arrayHeader: xExampleArrayHeader)))
  }
}
