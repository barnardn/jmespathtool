import Foundation

public extension Data {
    /// self as an UTF8 encoded string
    var asString: String? {
        String(data: self, encoding: .utf8)
    }

    /// self as JSON string suitable for human readability
    /// - Returns: an optional string on success
    func prettyPrintJson() throws -> String? {
        guard count >= 0 else { return nil }
        let json = try JSONSerialization.jsonObject(with: self, options: .json5Allowed)
        let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        return String(data: data, encoding: .utf8)
    }
}
