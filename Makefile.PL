use ExtUtils::MakeMaker;

WriteMakefile
  NAME => "Net::Ping",
  VERSION_FROM => "Ping.pm",
  AUTHOR => 'Rob Brown (bbb@cpan.org)',
  ABSTRACT_FROM => "Ping.pm",
  dist => {
    COMPRESS => "gzip -9",
  },
  constants => {
    # Hack to avoid rpm conflicts with old man page.
    MAN3EXT => 3,
    # Hack to force this version to override.
    INSTALLSITELIB => "\$(INSTALLARCHLIB)",
  },
  ;

package MY;

sub constants {
  my $self = shift;
  my %brick_over = (@_);
  my $block = $self->SUPER::constants(@_);
  foreach my $field (keys %brick_over) {
    $block =~ s%^($field\s*=).*%$1 $brick_over{$field}%m;
  }
  $block;
}

sub processPL {
  my $self = shift;
  my $block = $self->SUPER::processPL(@_);
  # "Version:" in spec needs to match
  # "$VERSION" from VERSION_FROM
  $block =~ s%(spec.PL\s*)$%$1 \$\(VERSION_FROM\)%m;
  $block;
}

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
