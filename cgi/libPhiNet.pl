#!/usr/bin/perl -d

my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; #This is a better line if you use this in prod.
# Library for talking w/ phinet daemon
#
use strict;
use Carp qw(cluck);
do $config;
sub on()
{
  cluck("on() is deprecated, use switch() instead!\n");
  my $relay = shift;
  switch($relay, 1);
}
sub off()
{
  cluck("off() is deprecated, use switch() instead!\n");
  my $relay = shift;
  switch($relay, 0);
}
sub switch()
{
  if(scalar(@_) != 2)
  {
    confess("Wrong Args!!!!\n");
  }
  my $relay = shift;
  my $state = shift;
  if($state != 0 or $state != 1)
  {
    confess("State must be 0 or 1\n");
  }
  if (-e $daemonpidfile)
  {
    croak("Is the daemon alive???\n");
  }
  do $daemonpidfile;
  my $count;
  if (-e $ipcfile)
  {
    while(-e $ipcfile)
    {
      sleep(0.5);
      $count++
      if($count == 20)
      {
        croak("IPC locking timed out")
      }
    }
  }
  my $pfile_fh;
  open($pfile_fh, ">", $ipcfile) or croak("Can't open IPC file: $!\n");
  print($pfile_fh '$pid = ' . "$$\n");
  print($pfile_fh '$relay = ' . "$relay\n");
  print($pfile_fh '$state = ' . "$state\n");
  close($pfile_fh);
  kill('USR1', $daemonpid);
  $SIG{USR1} = sub {return 1};
  sleep(10);
  return 0;
}
1;
