use ExtUtils::MakeMaker;

WriteMakefile
  NAME => "Net::Ping",
  VERSION_FROM => "Ping.pm",
  dist => {
    COMPRESS => "gzip -9",
  };

package MY;

sub libscan {
  my $self = shift;
  my $path = shift;
  ($path =~ / \bCVS\b | \~$ /x) ? undef : $path;
}

sub postamble {
  return qq^

pm_to_blib: README

README: Ping.pm
\tpod2text Ping.pm > README
  ^;
}

1;
