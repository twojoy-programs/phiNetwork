# Example config file.
# FYI: This is executable perl code. All of its rules apply.
#

$prod            = "0";
# Whether in production or not.
if($prod) # Production config
{
  # On my system the web root is /var/www/html.
  $daemonpidfile = "/var/www/phiNet/pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  $ipcfile       = "/var/www/phiNet/ipc.conf.pl";
  # Where the IPC file will be
  $libraries     = "/var/www/phiNet/libPhiNet.pl";
  # Where the library is.
  $data          = "/var/www/phiNet/query.data.pl";
  # Where the query response data is.
  $gpioLib       = "/var/www/phiNet/gpiolib.pl";
}
else     # Development config
{
  $daemonpidfile = "./pid.conf.pl";
  # Where the file for the daemon's PID will be stored.
  $ipcfile       = "./ipc.conf.pl";
  # Where the IPC file will be
  $libraries     = "./libPhiNet.pl";
  # Where the library is.
  $data          = "./query.data.pl";
  # Where the query response data is.
  $gpioLib       = "./gpioLib.pl";
}
# Relay Addresses.
# Addresses for the "On" state of the relays.
@relay_on  =
(
  1 => 0,
  2 => 0,
  3 => 0,
  4 => 0,
  5 => 0
);
# Addresses for the "Off" state of the relays.
@relay_off =
(
  1 => 0,
  2 => 0,
  3 => 0,
  4 => 0,
  5 => 0
);

# Whether to validate the password or not. Set this to false if you already have
# a mechanism to make sure bad people don't mess up the relays.
$use_pw          = 1;

# This is the password, hashed 2 times with SHA256 (with hex output)
$password        = `cat password.conf`; # This arrangement makes it easy to
                                           # test (and keep the PW secret.)

# Number of relays.
$numofrelays     = "3";
