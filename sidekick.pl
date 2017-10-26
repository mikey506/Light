# Basic Sidekick Bot
# This is a very basic irc bot script,
#
# Written by Michael Landry (mikey@bbsn.ca)

 use Socket;
 use IO::Socket;
 use IO::Socket::INET;
 use IO::Select;

  my $bnick = "SideKick";
  $fd = IO::Socket::INET->new(PeerAddr => 'irc.bbsn.ca',
                                 PeerPort => '6667',
                                 Proto    => 'tcp', 
                                 Timeout => 60,);
  print $fd "NICK $bnick \r\n";
  print $fd "USER ternary \"\" \"\" :Real Slim Code-y\r\n";

while ($in = <$fd>) {
  $in =~ s/\:/ /g;
  $in =~ s/\!/ /g;
  $in =~ s/\@/ /g;
  $in =~ s/\  / /g;
  #  print $in;
  $in =~ s/\ /,/g;
  my @tok = split(',', $in);
  foreach my $val (@tok) {
    print "$val ";
  }
  print "\n";
  if ($tok[0] eq "PING") {
    print $fd "PONG :$tok[1]\n";
  }
  if ($tok[4] eq "PRIVMSG") {
    if ($tok[5] eq "VERSION") {
      my $user = $tok[1];
      print $fd "PRIVMSG #Sysops $user has done ctcp on me.\r\n";
    }
    if ($tok[5] eq "FINGER") {
      my $user = $tok[1];
      print $fd "PRIVMSG #Sysops $user has done ctcp finger on me.\r\n";
    }
    if ($tok[6] eq '.join') {
      my $user = $tok[1];
      print $fd "JOIN $tok[7]\n"; 
    }
    if ($tok[6] eq '.part') {
      my $user = $tok[1];
      print $fd "PART $tok[7]\n";
    }

  }
  if ($tok[1] == 003) {
    print $fd "NICK $bnick \r\n";
    print $fd "USER ternary \"\" \"\" :Real Slim Code-y\r\n";
    sleep(3);      
    print $fd "JOIN #BBSN\n";
    print $fd "JOIN #Sysops\n";
  }
}
1;
