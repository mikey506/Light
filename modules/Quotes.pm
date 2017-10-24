# Shadow Module: Quotes.pm
# Random quotes fetched from local file
#
# Location of quote file: "./quotes" (Shadows root folder)
# Usage: .quote
#
# Written by Michael Landry

package Quotes;

use warnings;

my $bot  = Shadow::Core;
use File::RandomLine;
my $rl = File::RandomLine->new( "./quotes" );

sub loader {
  $bot->add_handler('chancmd quote', 'doQuote');
  my ($nick, $host, $text) = @_;
  $bot->say($nick, "Help for \x02QUOTE\x02:");
  $bot->say($nick, "-------------------------");
  $bot->say($nick, "\x02quote\x02 print a random, Quote");
  $bot->say($nick, "\x02SYNTAX\x02: .quote");
}

sub doQuote {
  my ($nick, $host, $chan, $text) = @_;
  $line = $rl->next();
  $bot->say($chan, "Your random Quote $nick : $line" );
}
sub doAddQuote {
  my ($nick, $host, $chan, $text) = @_;
  open(my $fd, ">>./quotes");
  print $fd "$text";
  $bot->say($chan, "Added Following Quote: $text");
}
sub unloader {
  $bot->del_handler('chancmd quote', 'doQuote');
  $bot->del_handler('chancmd addquote', 'doQuote');
}
1;
