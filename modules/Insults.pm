# Shadow Module: Insult.pm
# Random insults fetched from local file
#
# Location of quote file: "./insults" (Shadows root folder)
# Usage: .insult <nick>
#
# Written by Michael Landry

package Insults;

my $bot  = Shadow::Core;
use File::RandomLine;
my $rl = File::RandomLine->new( "./insults" );

sub loader {
  $bot->add_handler('chancmd insult', 'doInsult');
  my ($nick, $host, $text) = @_;
  if ($text = "help") {
  $bot->say($nick, "Help for \x02Insult\x02:");
  $bot->say($nick, "Usage: .insult <nick>");
 }
}

sub doInsult {
  my ($nick, $host, $chan, $text) = @_;
  $line = $rl->next();
  $bot->say($chan, "$text - $line" );
}
sub unloader {
  $bot->del_handler('chancmd insult', 'doInsult');
}
1;
