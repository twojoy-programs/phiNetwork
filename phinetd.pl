#!/usr/bin/perl
# PhiNet daemon
# This does most of the work
my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; # This is a better line if you use this in prod.
#
use warnings;
use strict;
use v5.14;
do $config;
$SIG{INT} = \&cleanup;
$SIG{HUP} = \&loadconf;
if(-e $daemonpidfile)
{
  say("Lockfile detected!");
  say("This either means that another daemon is running,");
  say("or that the last daemon exited (abruptly) and left");
  say("the PID file behind. If you believe in the latter,");
  say("delete $daemonpidfile. If not, stop the other daemon.");
}
given($numberofrelays)
{
  when(1) {gpio_export($relay_off[1]); gpio_export($relay_on[1]); }
  when(2) {gpio_export($relay_off[1]); gpio_export($relay_on[1]);
           gpio_export($relay_off[1]); gpio_export($relay_on[1]); }
  when(3) {gpio_export($relay_off[1]); gpio_export($relay_on[1]);
           gpio_export($relay_off[2]); gpio_export($relay_on[2]);
           gpio_export($relay_off[3]); gpio_export($relay_on[3]);}
  when(4) {gpio_export($relay_off[1]); gpio_export($relay_on[1]);
           gpio_export($relay_off[2]); gpio_export($relay_on[2]);
           gpio_export($relay_off[3]); gpio_export($relay_on[3]);
           gpio_export($relay_off[4]); gpio_export($relay_on[4]);}
  when(5) {gpio_export($relay_off[1]); gpio_export($relay_on[1]);
           gpio_export($relay_off[2]); gpio_export($relay_on[2]);
           gpio_export($relay_off[3]); gpio_export($relay_on[3]);
           gpio_export($relay_off[4]); gpio_export($relay_on[4]);
           gpio_export($relay_off[5]); gpio_export($relay_on[5]);}
  default {}
}
sub cleanup()
{
  unlink $daemonpidfile;
  given($numberofrelays)
  {
    when(1) {gpio_unexport($relay_off[1]); gpio_unexport($relay_on[1]); }
    when(2) {gpio_unexport($relay_off[1]); gpio_unexport($relay_on[1]);
             gpio_unexport($relay_off[1]); gpio_unexport($relay_on[1]); }
    when(3) {gpio_unexport($relay_off[1]); gpio_unexport($relay_on[1]);
             gpio_unexport($relay_off[2]); gpio_unexport($relay_on[2]);
             gpio_unexport($relay_off[3]); gpio_unexport($relay_on[3]);}
    when(4) {gpio_unexport($relay_off[1]); gpio_unexport($relay_on[1]);
             gpio_unexport($relay_off[2]); gpio_unexport($relay_on[2]);
             gpio_unexport($relay_off[3]); gpio_unexport($relay_on[3]);
             gpio_unexport($relay_off[4]); gpio_unexport($relay_on[4]);}
    when(5) {gpio_unexport($relay_off[1]); gpio_unexport($relay_on[1]);
             gpio_unexport($relay_off[2]); gpio_unexport($relay_on[2]);
             gpio_unexport($relay_off[3]); gpio_unexport($relay_on[3]);
             gpio_unexport($relay_off[4]); gpio_unexport($relay_on[4]);
             gpio_unexport($relay_off[5]); gpio_unexport($relay_on[5]);}
    default {}
  }
  exit();
}
sub loadconf()
{do $config; do $gpioLib;}
open(PIDFILE, ">", $daemonpidfile) or die "Can't open process id (lock)file: $!";
print(PIDFILE, '$daemonpid = ' . "$$\n");
close(PIDFILE);
sub ipc()
{
  do $ipcfile;
  if($state)
  {
    given($relay)
    {
      when(1) {gpio_pulse($relay_on[1])}
      when(2) {gpio_pulse($relay_on[2])}
      when(3) {gpio_pulse($relay_on[3])}
      when(4) {gpio_pulse($relay_on[4])}
      when(5) {gpio_pulse($relay_on[5])}
    }
  }
  if(not $state)
  {
    given($relay)
    {
      when(1) {gpio_pulse($relay_off[1])}
      when(2) {gpio_pulse($relay_off[2])}
      when(3) {gpio_pulse($relay_off[3])}
      when(4) {gpio_pulse($relay_off[4])}
      when(5) {gpio_pulse($relay_off[5])}
    }
  }
  kill("USR1", $pid);
  unlink $ipcfile;
}
$SIG{USR1} = \&ipc;
my $counter = 0;
while(1)
{
  $counter++;
}
