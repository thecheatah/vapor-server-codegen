import Vapor
import VaporTestInterface

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  try VaporTestInterface.routes(router, anotherAuthentication: AnotherAuthenticationController(), authentication: AuthenticationController(), dataModel: DataModelController(), formData: FormDataController(), headers: HeadersController(), multipleResponseCodes: MultipleResponseCodesController(), pathParsing: PathParsingController(), queryParameters: QueryParametersController(), authForSecurity1: SecurityMiddleware(), authForSecurity2: AnotherSecurityMiddleware())
}
