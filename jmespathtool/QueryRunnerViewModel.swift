import AppKitTools
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
    @ObservationIgnored
    @Dependency(\.pasteboardClient) var pasteboardClient

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
        jsonInput = pasteboardClient.firstString() ?? ""
    }

    public func addResultsToClipboard() {
        pasteboardClient.addString(queryResults)
    }
}
