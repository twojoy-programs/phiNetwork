#!/usr/bin/perl
#
#

use strict;
use warnings;
use Digest::SHA qw(sha256_hex);
use CGI;
my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; #This is a better line if you use this in prod.
require $config;


require $data;
my $query = CGI->new;
my %input = $query->keywords;
if (not -e $daemonpidfile)
{
  print($error_daemondead);
  exit(0)
}
require "./libPhiNet.pl"; #$libraries;
if ($input{"test"} != "larrywall")
{
  print($error_wrongform);
  exit(0);
}
my $pwhash = sha256_hex($input{"pw"});
if ($pwhash != $password)
{
  print($error_wrongpw);
  exit(0)
}
if ($input{"state"})
{
  on($input{"sw"});
  print($success);
  exit(0);
}
if (not $input{"state"})
{
  off($input{"sw"});
  print($success);
  exit(0);
}
