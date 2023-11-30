import Dependencies
import Foundation
import JMESPathClient
import SwiftUI

@Observable final class QueryRunnerViewModel {
    var queryString = ""
    var jsonInput = ""
    var queryResults = ""

    @ObservationIgnored
    @Dependency(\.jmesPathClient) var jmesPathClient

    init() { }

    public func runQuery() {
        guard !jsonInput.isEmpty, !queryString.isEmpty else { return }
        do {
            queryResults = try jmesPathClient.query(queryString, jsonInput) ?? ""
        } catch {
            print("bummer \(error)")
        }
    }

    public func jsonFromClipboard() {
        // TODO: probably not the best way to use pasteboard
        let json = NSPasteboard.general.pasteboardItems?.first?.string(forType: .string)
        jsonInput = json ?? ""
    }
}
