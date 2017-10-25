package Welcome;

# Welcome Module

 use Shadow::Core;
 use warnings;
 my $bot = Shadow::Core;

sub loader {
  $bot->add_handler('event join', 'doWelcome');
}

sub doWelcome {
   my ($nick,$chan,$host) = @_;
   print "Activity: $_[0] joined $_[2] \n ";
   $bot->say($_[2], "Hey $_[0] Welcome to the $_[2] IRC chatroom, feel free to idle in here in the channel or take part in dicussion." );
   $bot->say("#Sysops", "Activity: $_[0] JOINed $_[2]");
}

sub unloader {
  $bot->del_handler('event join', 'doWelcome');
}
1;
