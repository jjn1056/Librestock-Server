package Librestock::Schema::Result;

use Modern::Perl; 
use parent 'DBIx::Class::Core';

__PACKAGE__->load_components(qw/
    Helper::Row::NumifyGet
    Helper::Row::OnColumnChange
    Helper::Row::StorageValues
    Helper::Row::RelationshipDWIM
    DynamicDefault
    TimeStamp
    InflateColumn::DateTime
  /);

sub default_result_namespace { 'Librestock::Schema::Result' }

1;

=head1 NAME

Librestock::Schema::Result - The base result class

=head1 SYNOPSIS

	package Librestock::Schema::Result::User;
    use parent 'Librestock::Schema::Result';
	
=head1 DESCRIPTION

All Result classes will inherit from this.  This provides some base functions,
primarily from included components.  Please see the documentation for the
following components: L<DBIx::Class::Helpers>, L<DBIx::Class::DynamicDefault>,
L<DBIx::Class::Timestamp>, L<DBIx::Class::InflateColumn::DateTime>.

=head1 ATTRIBUTES

This class defines the following attributes.

=head1 METHODS

This module defines the following methods.

=head2 insert

modify global insert to provide a uuid PK if an insert is missing one.

=head2 default_result_namespace

Required by L<DBIx::Class::Helper::Row::RelationshipDWIM> to set the namespace
that gets prepended in relationships class names.

=head1 AUTHOR

See L<Librestock> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Librestock> for rights information.

=cut

