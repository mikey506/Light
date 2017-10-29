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
use IRC::Bot::Seen;
my $bot = Shadow::Core;
my $seen = IRC::Bot::Seen->new();

sub loader {
  $bot->add_handler('chancmd seen', 'iseen_id');
  $bot->add_handler('cmdchan join', 'iseen_join');
}

sub iseen_join {
  $seen->log_seen( $nick, "Joining $chan" );
  print "logging $nick joining $chan";
}

sub iseen_id {
  my ($nick, $host, $chan, $text) = @_;
  my ($user, $channel, @reason);
  my $bhost = $Shadow::Core::sc{lc($chan)}{users}{$nick}{host};
  $bot->say($chan, "$nick $text last seen $seen->get_seen( $text ); 
  $seen->log_seen( $nick, "Joining $chan" );
}
sub unloader {
  $bot->del_handler('chancmd seen', 'iseen_id');
  $bot->del_handler('cmdchan join', 'iseen_join');
}
1;
