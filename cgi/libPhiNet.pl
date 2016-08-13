#!/usr/bin/perl -d

my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; #This is a better line if you use this in prod.
# Library for talking w/ phinet daemon
#
use strict;
use Carp;
do $config;
if (-e $daemonpidfile)
{
  confess("Is the daemon alive???\n");
}
do $daemonpidfile;
sub on()
{
    my $arg = shift;
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
    open(PFILE ">", $ipcfile) or croak("Can't open IPC file: $!\n");
    print(PFILE '$pid = ' . "$$\n");
    print(PFILE '$relay = ' . "$arg\n");
    print(PFILE '$state = ' . "1\n");
    close(PFILE);
    kill('USR1', $daemonpid);
    $SIG{USR1} = sub {return 1};
    sleep(10);
    return 0;

}
sub off()
{
    my $arg = shift;
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
    open(PFILE, ">", $ipcfile) or croak("Can't open IPC file: $!\n");
    print(PFILE, '$pid = ' . "$$\n");
    print(PFILE, '$relay = ' . "$arg\n");
    print(PFILE, '$state = ' . "0\n");
    close(PFILE);
    kill('USR1', $daemonpid);
    $SIG{USR1} = sub {return 1};
    sleep(10);
    return 0;
}
1;
