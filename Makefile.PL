use ExtUtils::MakeMaker;
WriteMakefile(
    NAME => "Net::Ping",
    VERSION_FROM => "./Ping.pm",
    dist => {
             COMPRESS => "gzip -9",
            },
);
