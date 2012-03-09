package Librestock::Web;

our $VERSION = '0.01';

use Moose;
use Plack::Builder;
use Catalyst qw/
  ConfigLoader
/;

extends 'Catalyst';

__PACKAGE__->config(
  'Plugin::ConfigLoader' => {
    file => __PACKAGE__->path_to('share', 'etc')});

__PACKAGE__->setup;

around 'psgi_app', sub {
  my ($orig, $self, @args) = @_;
  my $psgi = $self->$orig(@args);

  builder {
    mount '/', builder {
      enable_if {
        $self->debug;
      } 'Debug', panels => $self->config->{debug_panels};
      $psgi;
    }
  };

};

__PACKAGE__->meta->make_immutable;

