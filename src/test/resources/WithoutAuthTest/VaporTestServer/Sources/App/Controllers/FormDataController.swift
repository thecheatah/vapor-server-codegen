//
//  FormDataController.swift
//  App
//
//  Created by Ravneet Singh on 4/3/19.
//

import Vapor
import VaporTestInterface

class FormDataController: FormDataApiDelegate {
  typealias AuthType = DummyAuthType.Type
  
  func formRequest(with req: Request, simpleString: SimpleString, simpleNumber: SimpleNumber, simpleInteger: SimpleInteger, simpleDate: SimpleDate, simpleEnumString: SimpleEnumString, simpleBoolean: SimpleBoolean, simpleArray: [SimpleString]) throws -> EventLoopFuture<formRequestResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(SimpleObject(simpleString: simpleString, simpleNumber: simpleNumber, simpleInteger: simpleInteger, simpleDate: simpleDate, simpleEnumString: simpleEnumString, simpleBoolean: simpleBoolean, simpleArray: simpleArray)))
  }
}
