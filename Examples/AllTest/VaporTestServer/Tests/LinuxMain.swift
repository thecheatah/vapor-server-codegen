import XCTest
@testable import AppTests

XCTMain([
  testCase(AppTests.allTests),
  testCase(PathParsingTests.allTests),
  testCase(QueryParametersTests.allTests),
  testCase(DataModelTests.allTests),
  testCase(MultipleResponseCodesTests.allTests),
  testCase(HeadersTests.allTests),
  testCase(FormDataTests.allTests),
  testCase(AuthenticationTests.allTests),
])
