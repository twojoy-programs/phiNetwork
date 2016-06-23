# Example config file.
# FYI: This is executable perl code. All of its rules apply.
use strict;

$prod            = "0";
# Whether in production or not.
if($prod)
{
  # On my system/ the web root is /var/www/html.
  $daemonpidfile = "/var/www/phiNet/pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  $ipcfile       = "/var/www/phiNet/ipc.conf.pl";
  # Where the IPC file will be
}
else
{
  $daemonpidfile = "./pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  $ipcfile       = "./ipc.conf.pl";
  # Where the IPC file will be
}
