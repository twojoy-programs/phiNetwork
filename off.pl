#!/usr/bin/perl
# This script tells the daemon to turn things off.
#
my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; #This is a better line if you use this in prod.
use strict;
do $config;
do $libraries;
my $programargs = $_;
my $helptext    = "Usage: off.pl <relayNumber>\n"
if($programargs)
{
  off($programargs) or die("Could not switch relay");
}
else
{
  print($helptext);
  exit(1);
}
