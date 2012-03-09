package Librestock::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';

action index
  : Path Args(0)
{
  $ctx->welcome_message;
}

action start
  : Chained('/') PathPrefix CaptureArgs(0) { }

 
action end : ActionClass('RenderView') {}
 
__PACKAGE__->meta->make_immutable;

