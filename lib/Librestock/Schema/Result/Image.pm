package Librestock::Schema::Result::Image;

use Librestock::Schema::Candy;

table 'image';

column image_id => {
  data_type => "integer",
  is_auto_increment => 1};

primary_key 'image_id';

column contributor_id => {
  data_type => "integer",
  is_foreign_key => 1},

  license_id => {
    data_type => "integer",
    is_foreign_key => 1};


belongs_to contributor =>
  ('::Contributor', 'contributor_id');

belongs_to license =>
  ('::License', 'license_id');

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
