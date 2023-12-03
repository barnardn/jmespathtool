import AppKitTools
import Dependencies
import Foundation
import FoundationTools
import JMESPathClient
import SwiftUI

@Observable final class QueryRunnerViewModel {
    var queryString = ""
    var jsonInput = ""
    var queryResults = ""
    var errorMessage = ""

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
            errorMessage = "Invalid query syntax"
        }
    }

    public func jsonFromClipboard() {
        guard
            let pbString = pasteboardClient.firstString(),
            let jsonStr = pbString.asPrettyPrintedJson
        else {
            jsonInput = ""
            return
        }
        jsonInput = jsonStr
    }

    public func addResultsToClipboard() {
        pasteboardClient.addString(queryResults)
    }

    public func clearErrorMessage() {
        errorMessage = ""
    }
}
