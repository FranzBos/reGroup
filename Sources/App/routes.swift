import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let ridesController = RidesController()
    router.get("rides", use: ridesController.index)
    router.post("rides", use: ridesController.create)
    router.delete("rides", Ride.parameter, use: ridesController.delete)
}
