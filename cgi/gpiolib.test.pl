# Test gpio library.
#
#use strict;
use warnings;
sub gpio_pulse()
{
  my $arg = shift;
  my $fh;
  open($fh, ">>", "log.txt");
  print $fh "Pulsed pin #" . $arg . "\n";
  close($fh);
}
1;
