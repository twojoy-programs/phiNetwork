#!/usr/bin/perl
use strict;
use File::ReadBackwards;
#print $0;
sub tail {
    my ($file, $num_lines) = @_;

    my $bw = File::ReadBackwards->new($file) or die "Can't read '$file': $!";

    my ($lines, $count);
    while (defined(my $line = $bw->readline) && $num_lines > $count++) {
        $lines .= $line;
    }

    $bw->close;

    return $lines;
}
# tail() is from http://stackoverflow.com/a/29267540.
my $git_dir = "../.git";
my $lastcommit = tail("$git_dir/logs/HEAD", 1);
my @lastcommit_split = split(/ /, $lastcommit);
my $output = substr($lastcommit_split[1], 0, 6);
print("Content-Type: text/plain\n\n");
print($output . "\n");
