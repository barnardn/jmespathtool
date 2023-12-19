import Dependencies
import Foundation

struct QueryPersistence {
    let loadAll: () throws -> [Query]
    let save: ([Query]) throws -> Void
}

extension QueryPersistence: DependencyKey {
    private static var filename = "jmespathtool-queries.json"
    private static var applicationSupportURL: URL {
        let urls = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        return urls.first!.appending(path: filename, directoryHint: .notDirectory)
    }

    static var liveValue = QueryPersistence(
        loadAll: {
            let jsonDecoder = JSONDecoder()
            let d = try Data(contentsOf: applicationSupportURL)
            return try jsonDecoder.decode([Query].self, from: d)
        },
        save: { queries in
            let jsonEncoder = JSONEncoder()
            let d = try jsonEncoder.encode(queries)
            try d.write(to: applicationSupportURL, options: .atomic)
        }
    )
}

extension QueryPersistence: TestDependencyKey {
    static var testValue = QueryPersistence(
        loadAll: unimplemented("QueryPersistence::loadAll", placeholder: []),
        save: unimplemented("QueryPersistence::save")
    )
    static var previewValue = QueryPersistence(
        loadAll: { [] },
        save: { _ in }
    )
}

extension DependencyValues {
    var queryPersistence: QueryPersistence {
        get { self[QueryPersistence.self] }
        set { self[QueryPersistence.self] = newValue }
    }
}
