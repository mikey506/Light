package Quotes;

# Quotes.pm - Random Quote Generator ( .quote )
# Written by Michael landry

my $bot  = Shadow::Core;
use File::RandomLine;
my $rl = File::RandomLine->new( "~/quotes" );

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

sub unloader {
	$bot->del_handler('chancmd quote', 'doQuote');
}

1;
