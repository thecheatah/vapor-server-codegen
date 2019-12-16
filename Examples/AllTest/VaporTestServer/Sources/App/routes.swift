import Vapor
import VaporTestInterface

/// Register your application's routes here.
func routes(_ app: Application) throws {
  try VaporTestInterface.routes(app, anotherAuthentication: AnotherAuthenticationController(), authentication: AuthenticationController(), dataModel: DataModelController(), formData: FormDataController(), headers: HeadersController(), multipleResponseCodes: MultipleResponseCodesController(), pathParsing: PathParsingController(), queryParameters: QueryParametersController(), authForSecurity1: SecurityMiddleware(), authForSecurity2: AnotherSecurityMiddleware())
}
