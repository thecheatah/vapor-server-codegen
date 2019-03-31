//
//  DataModelController.swift
//  App
//
//  Created by Ravneet Singh on 3/27/19.
//

import Vapor
import VaporTestInterface

class DataModelController: DataModelApiDelegate {
    func referencedObject(request: Request) throws -> EventLoopFuture<SimpleObject> {
        let result = SimpleObject(simpleString: "String", simpleNumber: 45, simpleInteger: 10, simpleDate: Date(), simpleEnumString: SimpleEnumString._1)
        return request.future(result)
    }
}
