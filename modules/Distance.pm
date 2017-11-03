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
  open my $fh, '<', './etc/geocities.db' or die "Cannot open file: $!\n";
  my @file = <$fh>;
  foreach $line (@file) {
    my @linestr = split / /, $line;
    if ($linestr[0] =~ /$fields[0]/ || $linestr[0] =~ /^$fields[0]/) {
      $chomp;
      $c2c1 = $linestr[1,2];
      $c2c1 =~ s/[\$#@~!&*()\[\];,:?^`\\\/]+//g;
      $bot->say($chan, "Found following entry in database for ( $linestr[0] ): $linestr[1] $linestr[2] ");
    }
    if ($linestr[0] =~ /$fields[1]/ || $linestr =~ /^$fields[1]/) {
      $chomp;
      $c2c2 = $linestr[1,2];
      $c2c2 =~ s/[\$#@~!&*()\[\];,:?^`\\\/]+//g;
      $bot->say($chan, "Found following entry in database for ( $linestr[0] ): $linestr[1] $linestr[2] ");
    }
  }
  print "(Distance Mod) $nick ." requested distance from ". $fields[0] ." to ". $fields[1] ." . Total Kilometers: ". $distance ."\n";
  $bot->say($chan, "$nick requested distance from $fields[0] to $fields[1] Total Kilometers:  $distance");
}
sub unloader {
  $bot->del_handler('chancmd dist', 'doDistance');
}
1;
