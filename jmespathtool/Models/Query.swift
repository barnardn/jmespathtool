import Foundation
import Tagged

struct Query: Codable, Identifiable {
    typealias Id = Tagged<Query, String>
    let id: Id
    let query: String
    let summary: String?

    init(id: String = UUID().uuidString, query: String, summary: String?) {
        self.id = Id.init(id)
        self.query = query
        self.summary = summary
    }
}

extension Query {
    static var previews: [Query] {
        [
            Query(id: "id-1", query: "locations[?state == 'WA'].name | sort(@) | {WashingtonCities: join(', ', @)}", summary: "Find all cities in WA"),
            Query(id: "id-2", query: "people[?age > `20`].[name, age]", summary: "Return the name and age of people over 20"),
            Query(id: "id-3", query: "sort_by(Contents, &Date)[*].{Key: Key, Size: Size}", summary: "Return the results sorted by date"),
            Query(id: "id-4", query: "people[?general.id==`100`].general | [0]", summary: "Some other kind of query or something"),
        ]
    }
}
