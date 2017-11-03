package Distance;

 use Data::Dumper;
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
  print ("fields array (c2c): (0) ". $fields[0] ." (1) ".$fields[1]." (2)  ".$fields[2]." (3)  ".$fields[3]." (4)  ".$fields[4]."\n");
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
}

sub unloader {
  $bot->del_handler('chancmd dist', 'doDistance');
}
1;
