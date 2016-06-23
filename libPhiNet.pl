#!/usr/bin/perl -d

my $config = "";
# Library for talking w/ phinet daemon
#
use strict;
use Carp;
do $config;
do $daemonpidfile;
sub on()
{
    my $arg = $_; # IDK why I did this, but I want to.
    if (-e $ipcfile)
    {
      while(-e $ipcfile)
      {
        sleep(0.5);
      }
    }
    if (not $arg)
    {
      confess("Arguments Needed!!!\n");
    }
    open(PFILE, ">", $ipcfile);
    print(PFILE, '$pid = ' . "$$\n");
    print(PFILE, '$relay = ' . "$arg\n");
    print(PFILE, '$state = ' . "1\n");
    close(PFILE);
    kill('USR1', $daemonpid);
}
sub off()
{
    my $arg = $_; # IDK why I did this, but I want to.
    if (-e $ipcfile)
    {
      while(-e $ipcfile)
      {
        sleep(0.5);
      }
    }
    if (not $arg)
    {
      confess("Arguments Needed!!!\n");
    }
    open(PFILE, ">", $ipcfile);
    print(PFILE, '$pid = ' . "$$\n");
    print(PFILE, '$relay = ' . "$arg\n");
    print(PFILE, '$state = ' . "0\n");
    close(PFILE);
    kill('USR1', $daemonpid);
}
1;
