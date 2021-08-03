import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Todo]> {
        Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        try req.content.decode(Todo.self).flatMap { todo in
            todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        try req.parameters.next(Todo.self).flatMap { todo in
            todo.delete(on: req)
        }.transform(to: .ok)
    }
}
