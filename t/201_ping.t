use strict;

BEGIN {
  if ($ENV{NO_NETWORK_TESTING} ||
      ($ENV{PERL_CORE}) && !$ENV{PERL_TEST_Net_Ping}) {
    print "1..0 # Skip: network dependent test\n";
    exit;
  }
  unless (eval "require Socket") {
    print "1..0 \# Skip: no Socket\n";
    exit;
  }
  unless (getservbyname('echo', 'tcp')) {
    print "1..0 \# Skip: no echo port\n";
    exit;
  }
}

# Hopefully this is never a routeable host
my $fail_ip = $ENV{NET_PING_FAIL_IP} || "192.0.2.0";
my $fail_host = 'invalid-hostname.xxxx';

# Remote network test using defaults.
#
# NOTE:
#   Network connectivity will be required for all tests to pass.
#   Firewalls may also cause some tests to fail, so test it
#   on a clear network.

use Test::More tests => 4;
BEGIN {use_ok('Net::Ping');}

my $p = Net::Ping->new();
isa_ok($p, 'Net::Ping', 'new() worked');

# failing host lookup does not croak
if ($p->ping($fail_host)) {
  ok (1, "SKIP $fail_host unexpectedly resolved");
} else {
  ok (1, "$fail_host returns undef");
}

is($p->ping($fail_ip), 0, "Can't reach $fail_ip");
