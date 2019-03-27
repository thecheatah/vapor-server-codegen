//
//  DataModelController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class DataModelController: DataModelApiDelegate {
    func referencedObject() throws -> EventLoopFuture<SimpleObject> {
        throw HTTPError(identifier: "NOT_IMPLEMENTED", reason: "Not Implemented")
    }
}
