package Librestock::Schema::Result::Account;

use Librestock::Schema::Candy
  -components => ['EncodedColumn'];

table 'account';

primary_column account_id => {
  data_type => "integer",
  is_auto_increment => 1};

unique_column email => {
  data_type => 'varchar',
  size => '96'},

column password => {
    data_type => 'char',
    size => 40,
    encode_column => 1,
    encode_check_method => 'check_password',
    encode_class => 'Digest',
    encode_args => {
      format => 'hex',
      algorithm => 'SHA-1'}};

might_have contributor => (
  '::Contributor', 'account_id');

1;

=head1 NAME

Librestock::Schema::Result::Account

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
