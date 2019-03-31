import XCTest
@testable import AppTests

XCTMain([
  testCase(AppTests.allTests),
  testCase(PathParsingTests.allTests),
  testCase(QueryParametersTests.allTests)
])
