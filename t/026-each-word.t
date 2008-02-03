#!perl -T
use strict;
use warnings;
use Test::More tests => 2;
use Test::Deep;
use Games::Word::Wordlist;

my $wl1 = Games::Word::Wordlist->new([]);
my @words1 = ();
$wl1->each_word(sub { push @words1, $_[0] });
is_deeply(\@words1, [], "each_word works with an empty word list");

my @wordlist = qw/foo bar baz quux/;
my $wl2 = Games::Word::Wordlist->new(\@wordlist);
my @words2 = ();
$wl2->each_word(sub { push @words2, $_[0] });
cmp_deeply(\@words2, bag(@wordlist),
           "each_word loops over all words in the word list");
