# Shadow Module: Sillywerd.pm
# Silly workds...
#
# Written by Michael Landry

 package Sillywerd;

 use Silly::Werder;
 my $bot  = Shadow::Core;
 my $werds = new Silly::Werder;

sub loader {
  $bot->add_handler('chancmd silly', 'doSilly');
}
 
sub doSilly {
  my ($nick, $host, $chan, $text) = @_;
#  print "doSilly activated\n";
  $werds->set_werds_num(3, 10);       
  $werds->set_syllables_num(3, 7);
  $werds->end_with_newline(1);
  $werds->set_language("English", "small");
  $sentence    = $werds->sentence;
  $question    = $werds->question;
  $exclamation = $werds->exclamation;
#  print "$question\n";
  $bot->say($chan, "$nick .. $question");
}

sub unloader {
  $bot->del_handler('chancmd silly', 'doSilly');
}
1;
