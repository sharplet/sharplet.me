import Fluent
import Vapor

final class Todo: Model, Content {
  static var schema: String {
    "todos"
  }

  @ID(custom: "id") var id: Int?
  @Field(key: "title") var title: String

  init() {}
}

struct CreateTodos: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("todos")
      .field("id", .int, .identifier(auto: true))
      .field("title", .string, .required)
      .create()
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("todos")
      .delete()
  }
}
