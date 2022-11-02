#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Encode;
use Path::Tiny;

my $out = '';

while (my $line = decode_utf8(<>)) {
  next if $line =~ m{^\d+&.*<br.*$}gmx;
  next if $line =~ m{^<b>\d+</b><br/>}gmx;
  next if $line =~ m{<b>(Oslo\sVenstre|F..?rste\sutkast|Bystyreprogram)</b><br/>}gmx;
  $line =~ s{&\#160;(<br/>)}{ }gmx;
  $line =~ s{&\#160;}{ }gmx;
  $line =~ s{<hr/>}{<br><br>}gmx;
  $line = "<br>\n$line" if $line =~ m{^<b>.*}gmx;
  $line =~ s{<b>(?:Oslo\s+)?(Venstre\s+vil:).*?</b>}{<h3>Gamle Oslo $1</h3>}gmxs;
  $line =~ s{<b>(.*?)</b>}{<h2>$1</h2>};
  $out .= $line;
}

my $temp = Path::Tiny->tempfile;
$temp->spew_utf8($out);

my $gfm = decode_utf8(`pandoc -f html -t gfm < $temp`);

$gfm =~ s/\n*?•\s([^*\#•]+?)\n*?/"\n- " . stripln($1) /gmxes;
$gfm =~ s{\#\#.*?(\#\# \s Kjære \s velger)}{$1}gmsx;
#$gfm =~ s/^- (.*?)\n(\S)/- $1 $2/gmxs;

print encode_utf8($gfm);

sub stripln {
  my $str = shift;
  $str =~ s/\n+/ /gmxs;
  return $str;
}
