//
//  DataModelController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface
import Authentication

class DataModelController: DataModelApiDelegate {
  typealias AuthType = DummyAuthType.Type

  func referencedObject(with req: Request, body: SimpleObject) throws -> Future<referencedObjectResponse> {
    return req.future(.http200(body))
  }
}
