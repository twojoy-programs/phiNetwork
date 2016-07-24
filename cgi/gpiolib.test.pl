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
sub gpio_unexport()
{
  my $arg = shift;
  my $fh;
  open($fh, ">>", "log.txt");
  print $fh "Exported pin #" . $arg . "\n";
  close($fh);
}
sub gpio_export()
{
  my $arg = shift;
  my $fh;
  open($fh, ">>", "log.txt");
  print $fh "Unexported pin #" . $arg . "\n";
  close($fh);
}
1;
