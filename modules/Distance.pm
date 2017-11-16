package Distance;

 use Data::Dumper;
 use GIS::Distance;
 my $bot = Shadow::Core;
 my $gis = GIS::Distance->new();
 
 sub loader {
   $bot->add_handler('chancmd dist', 'doDistance');
}

sub doDistance {
  my ($nick, $host, $chan, $text) = @_;
  my @fields = split / /, $text;
  open my $fh, '<', './etc/geocities.db' or die print "Cannot open file: $!\n";
  my @file = <$fh>;
  foreach $line (@file) {
    my @linestr = split / /, $line;
    if ($linestr[0] =~ /$fields[0]/ || $linestr[0] =~ /^$fields[0]/) {
      $chomp;
      $c1_1 = $linestr[1];
      $c1_2 = $linestr[2];
      $bot->say($chan, "Found following entry in database for ( $linestr[0] ): $linestr[1] $linestr[2] ");
    }
    if ($linestr[0] =~ /$fields[1]/ || $linestr =~ /^$fields[1]/) {
      $chomp;
      $c2_1 = $linestr[1];
      $c2_2 = $linestr[2];
      $bot->say($chan, "Found following entry in database for ( $linestr[0] ): $linestr[1] $linestr[2] ");
    }
  }
  $distance = $gis->distance( $c1_1 , $c1_2 => $c2_1 , $c2_2 );
  $distance = sprintf("%.3f", $distance);
  print "Debug: ". $c1_1 ." ". $c2_1 ." ". $c1_2 ." ". $c2_2; 
  print "(Distance Mod) ". $nick ." requested distance from ". $fields[0] ." to ". $fields[1] ." Total Kilometers: ". $distance ." km\n";
  $bot->say($chan, "$nick, your requested distance info from $fields[0] to $fields[1] - Total Distance: $distance km");
}
sub unloader {
  $bot->del_handler('chancmd dist', 'doDistance');
}
1;
