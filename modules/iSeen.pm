#!/usr/bin/perl -w
package iSeen;

# Shadow Module: iSeen
# 
# This module was created to allow users in a channel to use the 
# ".seen" command to check to see when the last time a spacific user was
# on the channel.
#
# Written by Mikey-506  <mikey@bbsn.ca>
#
# Version Info:
# - v0.1 - In early development
#

my $bot = Shadow::Core;
sub loader {
  $bot->add_handler('chancmd seen', 'iseen_id');
}

sub iseen_id {
  my ($nick, $host, $chan, $text) = @_;
  my ($user, $channel, @reason);
  my $bhost = $Shadow::Core::sc{lc($chan)}{users}{$nick}{host};
  $bot->log("[iSeen Module] (UserInfo) User: $nick Host: $host \n"); 
  $bot->say($nick, "I seen that you seen");
}
sub unloader {
  $bot->del_handler('chancmd seen', 'iseen_id');
}
1;
