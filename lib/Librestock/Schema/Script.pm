package Librestock::Schema::Script;

use Moose;
use Librestock::Web;
use DBIx::Class::Migration::Script;
 
extends 'DBIx::Class::Migration::Script';
 
sub defaults {
  sandbox_class => DBIx::Class::Migration::Script::SANDBOX_POSTGRESQL,
  schema => Librestock::Web->model('Schema')->schema,
}
 
__PACKAGE__->meta->make_immutable;
__PACKAGE__->run_if_script;
