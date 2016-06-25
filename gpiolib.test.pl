# Test gpio library.
#
use strict;
sub gpio_pulse()
{
  my $arg = shift;
  open($fh, ">>", "log.txt");
  print($fh, "Pulsed pin #$arg");
  close($fh);
}
