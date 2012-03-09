package Librestock::Schema::Result::Download;

use Librestock::Schema::Candy;

table 'download';

column user_id => {
  data_type => "integer",
  is_foreign_key => 1},

  image_id => {
    data_type => "integer",
    is_foreign_key => 1},

  downloaded_on => {
    data_type => "datetime",
    datetime_undef_if_invalid => 1};

primary_key 'user_id', 'image_id';

belongs_to user => (
  '::User', 'user_id');

belongs_to image => (
  '::Image', 'image_id');

1;

=head1 NAME

Librestock::Schema::Result::Download

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
