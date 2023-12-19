import Dependencies
import Foundation
import SwiftUI

@Observable final class SavedQueriesViewModel {
    private(set) var allQueries: [Query]

    @ObservationIgnored
    @Dependency(\.queryPersistence) var queryPersistence

    init(queries: [Query]) {
        self.allQueries = queries
    }

    public func delete(id: Query.ID) {
        let filtered = allQueries.filter { $0.id != id }
        allQueries = filtered
        do {
            try queryPersistence.save(allQueries)
        } catch {
            print("oh no \(error)")
        }
    }

    public func select(id: Query.ID) {
        print("user selected \(id)")
    }
}
