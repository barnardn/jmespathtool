import Foundation

public extension String {
    /// self as Data using UTF8 encoding
    var asUTF8Data: Data? {
        data(using: .utf8)
    }

    /// self as JSON suitable for human readability.
    /// Note: assumes self is json
    var asPrettyPrintedJson: String? {
        try? asUTF8Data?.prettyPrintJson()
    }
}
