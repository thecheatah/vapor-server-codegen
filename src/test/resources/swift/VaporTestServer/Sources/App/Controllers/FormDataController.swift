//
//  FormDataController.swift
//  App
//
//  Created by Ravneet Singh on 4/3/19.
//

import Vapor
import VaporTestInterface

class FormDataController: FormDataApiDelegate {
  func formRequest(request: Request, simpleString: SimpleString, simpleNumber: SimpleNumber, simpleInteger: SimpleInteger, simpleDate: SimpleDate, simpleEnumString: SimpleEnumString, simpleBoolean: SimpleBoolean, simpleArray: [SimpleString]) throws -> EventLoopFuture<formRequestResponse> {
    return request.future(.http200(SimpleObject(simpleString: simpleString, simpleNumber: simpleNumber, simpleInteger: simpleInteger, simpleDate: simpleDate, simpleEnumString: simpleEnumString, simpleBoolean: simpleBoolean, simpleArray: simpleArray)))
  }
}
