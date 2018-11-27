import Vapor

final class RidesController {
    
    func index(_ req: Request) throws -> Future<[Ride]> {
        return Ride.query(on: req).all()
    }

    func create(_ req: Request) throws -> Future<Ride> {
        return try req.content.decode(Ride.self).flatMap { ride in
            return ride.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Ride.self).flatMap { ride in
            return ride.delete(on: req)
        }.transform(to: .ok)
    }
}
