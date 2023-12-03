import AppKit
import Dependencies
import Foundation

/// A simple pasteboard client to inject as a dependency. Operates
/// on NSPasteboard.general
///
public struct PasteboardClient {
    public var firstString: () -> String?
    public var addString: (String) -> Void

    public init(
        firstString: @escaping () -> String?,
        addString: @escaping (String) -> Void
    ) {
        self.firstString = firstString
        self.addString = addString
    }
}

extension PasteboardClient: DependencyKey {
    public static var liveValue = PasteboardClient(
        firstString: {
            NSPasteboard.general.string(forType: .string)
        },
        addString: { str in NSPasteboard.general.setString(str, forType: .string) }
    )
}

extension PasteboardClient: TestDependencyKey {
    public static var testValue = PasteboardClient(
        firstString: unimplemented("PasteboardClient::firstString", placeholder: nil),
        addString: unimplemented("PasteboardClient::addString")
    )
    public static var previewValue = PasteboardClient(
        firstString: { nil },
        addString: { _ in }
    )
}

public extension DependencyValues {
    var pasteboardClient: PasteboardClient {
        get { self[PasteboardClient.self] }
        set { self[PasteboardClient.self] = newValue }
    }
}
