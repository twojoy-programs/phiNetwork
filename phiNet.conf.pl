# Example config file.
# FYI: This is executable perl code. All of its rules apply.

use strict;
my $prod            = "0";
# Whether in production or not.
if($prod) # Production config
{
  # On my system/ the web root is /var/www/html.
  my $daemonpidfile = "/var/www/phiNet/pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  my $ipcfile       = "/var/www/phiNet/ipc.conf.pl";
  # Where the IPC file will be
  my $libraries     = "/var/www/phiNet/libPhiNet.pl"
  # Where the library is.
  my $data          = "/var/www/phiNet/query.data.pl"
  # Where the query response data is.
}
else     # Development config
{
  my $daemonpidfile = "./pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  my $ipcfile       = "./ipc.conf.pl";
  # Where the IPC file will be
  my $libraries     = "./libPhiNet.pl"
  # Where the library is.
  my $data          = "./query.data.pl"
  # Where the query response data is.
}
my $password        = `cat password.conf`; # This arrangement makes it easy to
                                           # test (and keep the PW secret.)
# This is a SHA256 (hex) hash of the actual PW.
