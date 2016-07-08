#!/usr/bin/perl
# PhiNet daemon
# This does most of the work
my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; # This is a better line if you use this in prod.
#
use warnings;
use strict;
use feature;
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
sub cleanup()
{
  unlink $daemonpidfile;
  gpio_unexport();
  exit();
}
sub loadconf()
{do $config;}
open(PIDFILE, ">", $daemonpidfile);
print(PIDFILE, '$daemonpid = ' . "$$\n");
close(PIDFILE);
do $gpioLib;
sub ipc()
{
  do $ipcfile;
  if($state)
  {
    given($relay)
    {
      when(1) {gpio_pulse($relay1_1)}
      when(2) {gpio_pulse($relay2_1)}
      when(3) {gpio_pulse($relay3_1)}
      when(4) {gpio_pulse($relay4_1)}
      when(5) {gpio_pulse($relay5_1)}
    }
  }
  if(not $state)
  {
    given($relay)
    {
      when(1) {gpio_pulse($relay1_0)}
      when(2) {gpio_pulse($relay2_0)}
      when(3) {gpio_pulse($relay3_0)}
      when(4) {gpio_pulse($relay4_0)}
      when(5) {gpio_pulse($relay5_0)}
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
