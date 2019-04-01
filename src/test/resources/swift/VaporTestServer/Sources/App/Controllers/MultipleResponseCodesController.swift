//
//  MultipleResponseCodesController.swift
//  App
//
//  Created by Ravneet Singh on 3/31/19.
//

import Vapor
import VaporTestInterface

class MultipleResponseCodesController: MultipleResponseCodesApiDelegate {
  func multipleResponseCodes(request: Request) throws -> EventLoopFuture<multipleResponseCodesResponse> {
    return request.future(.http200())
  }
}
