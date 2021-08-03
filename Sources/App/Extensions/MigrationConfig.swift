import FluentSQLite

extension MigrationConfig {
    mutating func add<M: SQLiteModel & Migration>(model: M.Type) {
        add(model: model, database: .sqlite)
    }
}
