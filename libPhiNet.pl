#!/usr/bin/perl -d

my $config = "";
# Library for talking w/ phinet daemon
#
use strict;
do $config;
sub on()
{
    my $arg = $_; # IDK why I did this, but I want to.
    if (-e $file)
    {
      while(-e $file)
      {
        sleep(0.5);
      }
    }
    open(PFILE, ">", $file);
    print(PFILE, '$pid = ' . "$$\n");
    print(PFILE, '$relay = ' . "$arg\n")
    print(PFILE, '$state = ' . "$1\n")
}
sub off()
{
    my $arg = $_; # IDK why I did this, but I want to.
    if (-e $file)
    {
      while(-e $file)
      {
        sleep(0.5);
      }
    }
    open(PFILE, ">", $file);
    print(PFILE, '$pid = ' . "$$\n");
    print(PFILE, '$relay = ' . "$arg\n")
    print(PFILE, '$state = ' . "0\n")
}
1;
