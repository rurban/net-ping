use ExtUtils::MakeMaker;

WriteMakefile
  NAME => "Net::Ping",
  AUTHOR => "Rob Brown",
  ABSTRACT_FROM => "Ping.pm",
  VERSION_FROM => "Ping.pm",
  clean => {
    FILES => q[*.bak *~ *.spec],
  },
  dist => {
    COMPRESS => "gzip -9",
  },
  # Hack to force this version to override.
  INSTALLSITELIB => '$(INSTALLARCHLIB)',
  # Really big hack to avoid rpm conflicts
  # with old man pages.
  MAN3EXT => 3,
  ;

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
	pod2text Ping.pm > README
  ^;
}

1;
