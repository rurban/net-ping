#!/usr/bin/env perl

use strict;
use warnings;
use Config;

BEGIN {
  unless (eval "require Socket") {
    print "1..0 \# Skip: no Socket\n";
    exit;
  }
  unless (getservbyname('echo', 'tcp')) {
    print "1..0 \# Skip: no echo port\n";
    exit;
  }
  unless ($Config{d_getpbyname}) {
    print "1..0 \# Skip: no getprotobyname\n";
    exit;
  }
}

use Net::Ping;
use Test::More tests => 5;

# Like tcp protocol, but with many hosts
my $p = Net::Ping->new({
  proto => "syn",
  timeout => 2     # but dumping $p shows 5??
});

is ($p->{'timeout'}, 2, 'timeout overrides default');
is ($p->{'proto'}, 'syn', 'proto is honored');

$p = Net::Ping->new({
  tos => 184 # 0xb8 ip prec 5 for dscp 46 i.e. AF4 ping
});
is ($p->{'tos'}, 184, 'tos overrides default');

$p = Net::Ping->new({
  ttl => 2000
});
is ($p->{'ttl'}, 2000, 'ttl overrides default');

$p = Net::Ping->new({
  retrans => 1.5
});
is ($p->{'retrans'}, 1.5, 'retrans overrides default factor');

# p $VAR1 = bless( {
#                   'wbits' => '',
#                   'syn' => {},
#                   'port_num' => 7,
#                   'data' => '',
#                   'device' => undef,
#                   'family' => 2,
#                   'tos' => undef,
#                   'econnrefused' => undef,
#                   'stop_time' => 0,
#                   'retrans' => '1.2',
#                   'data_size' => 0,
#                   'local_addr' => undef,
#                   'seq' => 0,
#                   'proto' => 'syn',
#                   'timeout' => 5,
#                   'proto_num' => 6,
#                   'bad' => {}
# }, 'Net::Ping' );
