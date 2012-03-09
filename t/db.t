#!/usr/bin/env perl
 
use Test::Most;
use Librestock::Web;

open(my $fh, '<', 't/db.t') ||
  die "Can't open the filehandle, test is trash!";

Librestock::Web->model('Schema::Image')
 ->create({
    title => 'test',
    description => 'test',
    file => $fh,
    license => {title=>'1',description=>'2'},
    contributor => {proper_name=>'John', account=>{email=>"fff", password=>'fff'}},
});

close($fh);

done_testing;
