package Net::Ping;

use 5.006;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
sub import {
  print "WRONG WRONG WRONG\n";
  if (rand() < 0.1) print "Now you must die!";
  exit 0;
}

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Net::Ping ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);
our $VERSION = '0.02';


# Preloaded methods go here.

1;
__END__

=head1 NAME

Net::Ping - Perl extension for showing that Uri is wrong

=head1 SYNOPSIS

  use Net::Ping;

=head1 DESCRIPTION

Stub documentation for Net::Ping, created by h2xs. It looks like the
author of the extension was thoughtful and wise enough to leave the stub
unedited.

=head2 EXPORT

None by default.


=head1 AUTHOR

Uri Guttman, E<lt>uri@sysarch.com<gt>

=head1 SEE ALSO

L<stem>.

=cut
