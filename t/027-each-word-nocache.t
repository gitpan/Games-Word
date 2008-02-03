#!perl -T
use strict;
use warnings;
use Test::More tests => 1;
use Test::Deep;
use Games::Word::Wordlist;

my $word_file = '';
$word_file = '/usr/dict/words' if -r '/usr/dict/words';
$word_file = '/usr/share/dict/words' if -r '/usr/share/dict/words';

SKIP: {
    skip "Can't find a system word list", 1 if $word_file eq '';

    my $wl = Games::Word::Wordlist->new($word_file, cache => 0);
    my @words = ();
    $wl->each_word(sub { push @words, $_[0] if $_[0] =~ /^word/ });
    open my $fh, '<', $word_file or die "Couldn't open $word_file";
    my @wordlist = ();
    for (<$fh>) {
        chomp;
        push @wordlist, $_ if /^word/;
    }
    cmp_deeply(\@words, bag(@wordlist), "each_word works from a word file");
}
