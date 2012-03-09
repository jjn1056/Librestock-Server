package Librestock::Schema::Result::User;

use Librestock::Schema::Candy;

table 'user';

column user_id => {
  data_type => "integer",
  is_auto_increment => 1};

primary_key 'user_id';

column account_id => {
  data_type => "integer",
  is_foreign_key => 1};

belongs_to account => (
  '::Account', 'account_id');

has_many download_rs => (
  '::Download',  'user_id');

many_to_many downloaded_images => (
  'download_rs', 'image');

1;

=head1 NAME

Librestock::Schema::Result::User

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
