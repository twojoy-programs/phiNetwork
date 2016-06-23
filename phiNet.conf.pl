# Example config file.
# FYI: This is executable perl code. All of its rules apply.
use strict;

my $prod            = "0";
# Whether in production or not.
if($prod)
{
  # On my system/ the web root is /var/www/html.
  my $daemonpidfile = "/var/www/phiNet/pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  my $ipcfile       = "/var/www/phiNet/ipc.conf.pl";
  # Where the IPC file will be
}
else
{
  my $daemonpidfile = "./pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  my $ipcfile       = "./ipc.conf.pl";
  # Where the IPC file will be
}
my $password        = "";
# This is a SHA1 hash of the actual PW.
