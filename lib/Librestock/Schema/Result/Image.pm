package Librestock::Schema::Result::Image;

use File::Spec::Functions 'catdir';
use File::ShareDir::ProjectDistDir;
use Librestock::Schema::Candy
  -components => ['InflateColumn::FS'];

table 'image';

primary_column image_id => {
  data_type => "integer",
  is_auto_increment => 1};

column contributor_id => {
  data_type => "integer",
  is_foreign_key => 1},

  license_id => {
    data_type => "integer",
    is_foreign_key => 1},

  title => {
    data_type => "varchar",
    size => 64},

  description => {
    data_type => "text"},

  non_opened_license_url => {
    data_type => "varchar",
    size => 256,
    is_nullable => 1,
  },

  file => {
    data_type => 'varchar',
    is_fs_column => 1,
    fs_column_path =>
      catdir(dist_dir(__PACKAGE__), 'image_files'),
  };

belongs_to contributor => (
  '::Contributor', 'contributor_id');

belongs_to license => (
  '::License', 'license_id');

has_many download_rs => (
  '::Download',  'image_id');

many_to_many members_who_downloaded => (
  'download_rs', 'member');

1;

=head1 NAME

Librestock::Schema::Result::Image

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
