package Librestock::Schema::Result::Upload;

use Librestock::Schema::Candy;

table 'upload';

column upload_id => {
  data_type => "integer",
  is_auto_increment => 1};

primary_key 'upload_id';


belongs_to contributor =>
  ( '::Contributor', 'contributor_id');


1;

=head1 NAME

Librestock::Schema::Result::Upload

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut
