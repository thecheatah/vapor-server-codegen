//
//  DataModelController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class DataModelController: DataModelApiDelegate {
  func referencedObject(request: Request, body: SimpleObject) throws -> Future<referencedObjectResponse> {
    return request.future(.http200(body))
  }
}
