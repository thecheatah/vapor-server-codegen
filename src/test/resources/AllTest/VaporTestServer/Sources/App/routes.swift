import Vapor
import VaporTestInterface

/// Register your application's routes here.
public func routes(_ router: Router) throws {
/*
   
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    */
  try VaporTestInterface.routes(router, authentication: AuthenticationController(), dataModel: DataModelController(), formData: FormDataController(), headers: HeadersController(), multipleResponseCodes: MultipleResponseCodesController(), pathParsing: PathParsingController(), queryParameters: QueryParametersController(), authForSecurity1: SecurityMiddleware())
}
