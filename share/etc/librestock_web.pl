{
  name => 'Librestock::Web',
  default_view => 'HTML',
  disable_component_resolution_regex_fallback => 1,
  debug_panels => [
    qw(
      Timer         CatalystLog
      DBITrace      Response
      Environment   Parameters
      Memory
    ),
    [ 'DBIC::QueryLog', querylog_args => {passthrough=>1}],
  ],
  'Controller::Root' => {
    namespace => '',
  },
  'Model::Schema' => {
    traits => ['FromMigration', 'QueryLog::AdoptPlack', 'SchemaProxy'],
    schema_class => 'Librestock::Schema',
    extra_migration_args => {
      db_sandbox_class => 'DBIx::Class::Migration::PostgresqlSandbox'},
    install_if_needed => {
      default_fixture_sets => ['all_tables']},
  },
  'Model::Schema::Account' => {
    image_file_path => '__path_to(share,image_files)__',
  },
  'Model::Schema::Image' => {
    image_file_path => '__path_to(share,image_files)__',
  },
  'View::HTML' => {
    INCLUDE_PATH => [ '__path_to(share,html)__' ],
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER => 'page.tt',
  },
};

