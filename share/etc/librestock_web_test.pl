{
  'Model::Schema' => {
    traits => ['FromMigration'],
    schema_class => 'Librestock::Schema',
    extra_migration_args => {
      db_sandbox_class => 'DBIx::Class::Migration::PostgresqlSandbox',
      db_sandbox_builder_class => 'DBIx::Class::Migration::TempDirSandboxBuilder',
    },
    install_if_needed => {
      default_fixture_sets => ['all_tables']},
  },
};
