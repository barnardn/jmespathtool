import Dependencies
import Foundation
import SwiftUI

@Observable final class SavedQueriesViewModel {
    private(set) var allQueries: [Query]
    private(set) var selectedQuery: Query?

    init(queries: [Query]) {
        @Dependency(\.queryPersistence) var queryPersistence
        let queries = try? queryPersistence.loadAll()
        self.allQueries = queries ?? []
    }

    public func delete(id: Query.ID) {
        @Dependency(\.queryPersistence) var queryPersistence
        let filtered = allQueries.filter { $0.id != id }
        allQueries = filtered
        do {
            try queryPersistence.save(allQueries)
        } catch {
            print("oh no \(error)")
        }
    }

    public func select(id: Query.ID) {
        let selected = allQueries.first { $0.id == id }
        self.selectedQuery = selected
    }
}
