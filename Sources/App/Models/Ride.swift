import FluentSQLite
import Vapor

final class Ride: SQLiteModel {
    var id: Int?
    var title: String
    var time: CLong
    var place: String
    var distance: Double?

    init(id: Int? = nil, title: String, time: CLong, place: String, distance: Double? = nil) {
        self.id = id
        self.title = title
        self.time = time
        self.place = place
        self.distance = distance
    }
}

/// Allows `Ride` to be used as a dynamic migration.
extension Ride: Migration { }

/// Allows `Ride` to be encoded to and decoded from HTTP messages.
extension Ride: Content { }

/// Allows `Ride` to be used as a dynamic parameter in route definitions.
extension Ride: Parameter { }
