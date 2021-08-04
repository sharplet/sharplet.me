import Fluent
import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
  /// Returns a list of all `Todo`s.
  func index(_ req: Request) throws -> EventLoopFuture<[Todo]> {
    Todo.query(on: req.db).all()
  }

  /// Saves a decoded `Todo` to the database.
  func create(_ req: Request) throws -> EventLoopFuture<Todo> {
    let todo = try req.content.decode(Todo.self)
    return todo.save(on: req.db).map { todo }
  }

  /// Deletes a parameterized `Todo`.
  func delete(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
    let id = try req.parameters.require("id", as: Int.self)
    return req.db.transaction { db in
      Todo.find(id, on: db)
        .unwrap(or: Abort(.notFound))
        .flatMap { $0.delete(on: db).transform(to: .ok) }
    }
  }
}
