package Distance;

 use GIS::Distance;
 my $bot = Shadow::Core;
 my $gis = GIS::Distance->new();

sub loader {
   $bot->add_handler('chancmd dist', 'doDistance');
}

sub doDistance {
  print "dodistance detected\n";
  my ($nick, $host, $chan, $text) = @_;
  my @fields = split / /, $text;
  print ("fields array: (0) ". $fields[0] ." (1) ".$fields[1]." (2)  ".$fields[2]." (3)  ".$fields[3]." (4)  ".$fields[4]."\n");
  my $distance = $gis->distance( $fields[0],$fields[1] => $fields[2],$fields[3] );
  $bot->say($chan, "Distance: $distance km for: ( $fields[0] $fields[1] => $fields[2] $fields[3] )");
}

sub unloader {
  $bot->del_handler('chancmd dist', 'doDistance');
}
1;
