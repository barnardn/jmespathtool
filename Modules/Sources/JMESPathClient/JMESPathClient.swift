import Dependencies
import Foundation
import FoundationTools
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
            if let result = try expression.search(json: jsonInput) {
                let data = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                return data.asString
            }
            return nil
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
