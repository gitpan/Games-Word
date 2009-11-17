
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Games-Word',
  NAME      => 'Games::Word',
  AUTHOR    => "Jesse\ Luehrs\ \<doy\ at\ tozt\ dot\ net\>",
  ABSTRACT  => "utility\ functions\ for\ writing\ word\ games",
  VERSION   => '0.05',
  EXE_FILES => [ qw(bin/solve-spook.pl bin/solve-xghost.pl bin/solve-superghost.pl bin/jotto.pl bin/solve-ghost.pl bin/mastermind.pl bin/cryptogram.pl) ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::Exception" => '0',
    "List::MoreUtils" => '0',
    "Test::Deep" => '0',
    "Math::Combinatorics" => '0',
  },
  test => {TESTS => 't/*.t'}
);

