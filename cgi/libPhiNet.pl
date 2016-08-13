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
    my $relay = shift;
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
    my $pfile_fh;
    open($pfile_fh ">", $ipcfile) or croak("Can't open IPC file: $!\n");
    print($pfile_fh '$pid = ' . "$$\n");
    print($pfile_fh '$relay = ' . "$relay\n");
    print($pfile_fh '$state = ' . "1\n");
    close($pfile_fh);
    kill('USR1', $daemonpid);
    $SIG{USR1} = sub {return 1};
    sleep(10);
    return 0;

}
sub off()
{
    my $relay = shift;
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
    my $pfile_fh;
    open($pfile_fh, ">", $ipcfile) or croak("Can't open IPC file: $!\n");
    print($pfile_fh '$pid = ' . "$$\n");
    print($pfile_fh '$relay = ' . "$relay\n");
    print($pfile_fh '$state = ' . "0\n");
    close($pfile_fh);
    kill('USR1', $daemonpid);
    $SIG{USR1} = sub {return 1};
    sleep(10);
    return 0;
}

1;
