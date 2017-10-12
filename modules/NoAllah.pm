#!/usr/bin/perl -w
package NoAllah;

# Shadow Module: NoAllah
# 
# This module was created to remove relgious spam popping up on irc chatrooms
# bots that use the words "Allah" will be kicked and banned from channel to avoid
# religious spam flooding occurances. No commands are used for this module as it is
# made for automatic protection. Some settings will be added over time.
#
# Written by Mikey-506  <mikey@bbsn.ca>
#
# Version History:
# - v0.1.1 Added kick/ban feature using keywords "allah" and "Allah". Prints info
#     and also gives a warning to other members about the use of this word.
#
#


my $bot = Shadow::Core;

sub loader {
  $bot->add_handler('message channel', 'allah_id');
}

sub allah_id {
  my ($nick, $host, $chan, $text) = @_;
  my ($user, $channel, @reason);
  my $bhost = $Shadow::Core::sc{lc($chan)}{users}{$nick}{host};
  use strict;
  use warnings;


  if ($text =~ /[A|a]llah/ || $text =~ /^[a|A]llah/) {
    $bot->say($chan, "The word Allah is not permitted here, let this be a warning  (NoAllah-Mod)");
    $bot->kick($chan, $nick, "Allah is not allowed to be promoted here through bot spam, stop pushing your beliefs on others.");
    $bot->mode($chan, "+b", $nick);
    print "[NoAllah-Mod] Allah Detected ( $chan )( $nick ) ( $host ) >>  Kicked & Banned.\n";
    print "[NoAllah-Mod] (UserInfo) User: $nick Host: $host \n"; 
    $bot->say($nick, "Smarten the fuck up and stop spamming");
  }
}

sub unloader {
  $bot->del_handler('message channel', 'allah_id');
}
1;
