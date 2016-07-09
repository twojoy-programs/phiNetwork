# Example config file.
# FYI: This is executable perl code. All of its rules apply.
#
# FYI: This is how it should be used.
#my $config = "./phiNet.conf.pl";
#my $config = "/var/www/phiNet.conf.pl"; # This is a better line if you use this in prod.

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
  my $gpioLib       = "/var/www/phiNet/gpiolib.pl"
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
  my $gpioLib       = "./gpioLib.pl"
}
# Relay Addresses.
# Addresses for the "On" state of the relays.
my @relay_on  =
{
  1 => 0,
  2 => 0,
  3 => 0,
};
# Addresses for the "Off" state of the relays.
my @relay_off =
{
  1 => 0,
  2 => 0,
  3 => 0,
};

# This is the password, hashed 2 times with SHA256 (with hex output)
my $password        = `cat password.conf`; # This arrangement makes it easy to
                                           # test (and keep the PW secret.)

# Number of relays.
my $numofrelays     = "3";
