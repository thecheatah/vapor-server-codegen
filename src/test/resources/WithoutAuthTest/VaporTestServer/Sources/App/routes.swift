import Vapor
import VaporTestInterface

/// Register your application's routes here.
func routes(_ app: Application) throws {
  try VaporTestInterface.routes(app, dataModel: DataModelController(), formData: FormDataController(), headers: HeadersController(), multipleResponseCodes: MultipleResponseCodesController(), pathParsing: PathParsingController(), queryParameters: QueryParametersController())
}
