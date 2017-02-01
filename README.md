# Net-Ping

Net-Ping - check a remote host for reachability

## DOWNLOAD AND INSTALLATION

Download a release from CPAN using your favorite tool, such as cpan,
cpanm, or else from https://metacpan.org/release/Net-Ping and then
unpack the tar.gz file.

You're most welcome to contribute, in which case cloning or forking the git
repo at https://github.com/rurban/net-ping is a good place to start.

To build and install, just incant the typical mantra:

    perl Makefile.PL
    make
    make test
    make install

make test may fail with your particular firewall settings, and for ICMP
ping you need to sudo as root, so don't be worried if some tests fail.
Force install it then.
