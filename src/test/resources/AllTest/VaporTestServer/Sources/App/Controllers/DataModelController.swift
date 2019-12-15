//
//  DataModelController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class DataModelController: DataModelApiDelegate {
  typealias AuthType = SampleAuthType

  func referencedObject(with req: Request, body: SimpleObject) throws -> EventLoopFuture<referencedObjectResponse> {
    return req.eventLoop.makeSucceededFuture(.http200(body))
  }
}
