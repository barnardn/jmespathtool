import SwiftUI

@main struct JMSEPathToolApp: App {
    @Environment(\.openWindow) private var openWindow

    var body: some Scene {
        WindowGroup {
            QueryRunnerView()
        }.commands {
            CommandGroup(after: .windowArrangement) {
                Button(
                    "Saved Queries",
                    action: {
                        openWindow(id: "saved-queries")
                    }
                )
            }
        }
        WindowGroup(id: "saved-queries") {
            Text("Saved queries here")
        }
    }
}
