#!/usr/bin/perl
#
#

use strict;
use Digest::SHA qw(sha256_hex);
use CGI
my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; #This is a better line if you use this in prod.
do $config;
do $data;
my $query = CGI->new;
my @keywords = $query->keywords;
if ($keywords{"test"} = "larrywall")
{

}
