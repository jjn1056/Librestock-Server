package Librestock::Schema::Candy;

use Modern::Perl;
use parent 'DBIx::Class::Candy';

sub base { $_[1] || 'Librestock::Schema::Result' }

1;

=head1 NAME

Librestock::Schema::Candy - My Candy Class

=head1 SYNOPSIS

	package Librestock::Schema::Result::User;
    use Librestock::Schema::Candy;
	
=head1 DESCRIPTION

Our custom subclass of L<DBIx::Class::Candy>

=head1 METHODS

This module defines the following methods.

=head2 base

Sets the base class for all Results

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut


