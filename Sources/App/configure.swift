import FluentSQLiteDriver
import Vapor

public func configure(_ app: Application) throws {
  app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
  app.databases.use(.sqlite(.memory), as: .sqlite)
  app.migrations.add(CreateTodos())
  try routes(app)
}
