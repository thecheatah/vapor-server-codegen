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

  func referencedObject(with req: Request, body: SimpleObject) throws -> Future<referencedObjectResponse> {
    return req.future(.http200(body))
  }
}
