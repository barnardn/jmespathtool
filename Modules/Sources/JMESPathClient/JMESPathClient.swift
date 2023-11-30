import Dependencies
import Foundation
import JMESPath

public struct JMESPathClient {
    public let query: (String, String) throws -> String?
    public init(
        query: @escaping (String, String) throws -> String?
    ) {
        self.query = query
    }
}

extension JMESPathClient: DependencyKey {
    public static var liveValue = JMESPathClient(
        query: { queryString, jsonInput in
            let expression = try JMESExpression.compile(queryString)
            let result = try expression.search(json: jsonInput, as: String.self)
            return result
        }
    )
}

extension JMESPathClient: TestDependencyKey {
    public static var testValue = JMESPathClient(
        query: unimplemented("JMESPathClient::query", placeholder: nil)
    )
    public static var previewValue = JMESPathClient(
        query: { _, _ in nil }
    )
}

public extension DependencyValues {
    var jmesPathClient: JMESPathClient {
        get { self[JMESPathClient.self] }
        set { self[JMESPathClient.self] = newValue }
    }
}
