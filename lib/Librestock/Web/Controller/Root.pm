package Librestock::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;
use Lucy::Simple;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';

action index
  : Path Args(0)
{
  my ($first, @images) =
    $ctx->model("Schema::Image")->all;

  $ctx->stash(
    first_image => $first,
    images=>\@images);
}

action img($id) : Local Args(1)
{
  $ctx->res->content_type('image/jpeg');
  $ctx->res->body(
    $ctx->model('Schema::Image')
      ->find($id)->file->open('r'));
}

action thumb($id) : Local  Args(1)
{
  my $image = $ctx->model('Schema::Image')
      ->find($id)->file->slurp;

  $ctx->stash(
    x => 200, y => 200,
    current_view => 'Thumb',
    image => $image,
  );
}

action search : Local Args(0)
{
  (my $index = Lucy::Simple->new(
    path => $ctx->path_to('share','lindex'),
     language => 'en'))->search(
      query=>$ctx->req->parameters->{q});

  my @ids;
  while(my $hit = $index->next) {
    push @ids, $hit->{id};
  }

  $ctx->stash(ids => \@ids);
}

action start
  : Chained('/') PathPrefix CaptureArgs(0) { }


  action not_found : Action {
    $self->status_not_found( $ctx, 
      message => "Can't find the requested application");
  }

action end : ActionClass('RenderView') {}
 
__PACKAGE__->meta->make_immutable;

