#!/usr/bin/perl
# This script tells the daemon to turn things on.
#
use strict;
do libPhiNet.pl;
my $programargs = $_;
my $helptext    = "Usage: on.pl <relayNumber>\n"
if($programargs)
{
  on($programargs);
}
else
{
  print($helptext)
  exit(1);
}
