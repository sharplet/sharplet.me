import Vapor

public func routes(_ app: Application) throws {
  // Basic "It works" example
  app.get { _ in
    "It works!"
  }

  // Basic "Hello, world!" example
  app.get("hello") { _ in
    "Hello, world!"
  }

  // Example of configuring a controller
  let todoController = TodoController()
  app.get("todos", use: todoController.index)
  app.post("todos", use: todoController.create)
  app.delete("todos", ":id", use: todoController.delete)
}
