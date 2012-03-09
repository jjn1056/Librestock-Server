package Librestock::Schema::Result::Account;

use Librestock::Schema::Candy;

table 'account';

column account_id => {
  data_type => "integer",
  is_auto_increment => 1};

primary_key 'account_id';

might_have contributor => ( '::Contributor', 'account_id');

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
