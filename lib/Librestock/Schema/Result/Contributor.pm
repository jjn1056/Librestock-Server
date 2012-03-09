package Librestock::Schema::Result::Contributor;

use Librestock::Schema::Candy;

table 'contributor';

column contributor_id => {
  data_type => "integer",
  is_auto_increment => 1};

primary_key 'contributor_id';

column account_id => {
  data_type => "integer",
  is_foreign_key => 1},

column license_id => {
  data_type => "integer",
  is_foreign_key => 1};

belongs_to account => ( '::Account', 'account_id');
belongs_to default_license => ( '::License', 'license_id');
might_have image_rs => ( '::Image', 'contributor_id');
might_have upload_rs => ( '::Upload', 'contributor_id');

1;

=head1 NAME

Librestock::Schema::Result::Contributor

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
