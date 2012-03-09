package Librestock::Schema::Result::License;

use Librestock::Schema::Candy;

table 'license';

primary_column license_id => {
  data_type => "integer",
  is_auto_increment => 1};

column title => {
    data_type => "varchar",
    size => 64},

  description => {
    data_type => "text"};

has_many image_rs => (
  '::Image', 'license_id');

1;

=head1 NAME

Librestock::Schema::Result::License

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
