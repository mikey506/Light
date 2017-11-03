package BotStats;

# Shadow Module: BotStats
# This module adds a command which returns stats about this
# instance of Shadow.  Requires bot admin.
#
# COMMAND: /msg <bot> status
#
# Written by Aaron Blakely <aaron@ephasic.org>

use POSIX;
use Time::Seconds;
use Proc::ProcessTable;
use Sys::Info;
use Sys::CPU;
Sys::Info::Device::CPU;
use Sys::Info::Constants qw( :device_cpu );

my $LOADTIME = time();
my $bot      = Shadow::Core;
my $help     = Shadow::Help;

sub loader {
  if ($^O !~ /linux/) {
    print "Error: BotStats module is deisgned for linux systems.\n";
    print "       Some functions might not work as intended on other platforms.\n";
    return;
  }
  $bot->add_handler('chancmd status', 'BotStats_dostatus');
  $bot->add_handler('chancmd cpuinfo', 'cpuinfo');
  $help->add_help('status', 'Admin', '', 'Outputs current stats about the bot.', 1, sub {
  my ($nick, $host, $chan, $text) = @_;

    $bot->say($chan, "Help for \x02STATUS\x02:");
    $bot->say($chan, " ");
    $bot->say($chan, "\x02status\x02 will give you details about the bot such as memory usage, number of channels, and mod count.");
    $bot->say($chan, "\x02SYNTAX\x02: /msg $Shadow::Core::nick status");
  });
}

sub memusage {
    my $pid = (defined($_[0])) ? $_[0] : $$;
    my $proc = Proc::ProcessTable->new;
    my %fields = map { $_ => 1 } $proc->fields;
    return undef unless exists $fields{'pid'};
    foreach (@{$proc->table}) {
        if ($_->pid eq $pid) {
            return $_->size if exists $fields{'size'};
        };
    };
    return 0;
}

sub cpuinfo {
  my ($nick, $host, $chan, $text) = @_;
  my $info = Sys::Info->new;
  my $cpu = $info->device('CPU');
  my $os  = $info->os;
  $bot->say($chan, "Operating System is: ".  $os->name());
  $bot->say($chan, "CPU Cores: ". $cpu->identify());
}

sub BotStats_dostatus {
  my ($nick, $host, $chan, $text) = @_;

  if ($bot->isbotadmin($nick, $host)) {
    $bot->say($chan, "\x02*** BOT STATUS ***\x02");
    my $mem = memusage();
    if ($mem) {
      $mem  = $mem / 1024;
      $mem  = $mem / 1024;
      $mem  = floor($mem);
      $bot->say($chan, "Current Memory Usage: $mem MB");
    }
    my $info = Sys::Info->new;
    my $cpu  = $info->device( CPU => %options );
    my $os = $info->os;
    my $ostype = $os->name( long => 1 );
    my $cpucount = $cpu->count;
    my $cpuload = $cpu->load;
    $bot->say($chan, "Operating System: $ostype");
    $bot->say($chan, "-CPU Info- Cores: $cpucount / Load: $cpuload % ");

    my $chancount = 0;
    foreach my $m (keys %Shadow::Core::sc) {
      $chancount++;
    }

    $bot->say($chan, "Currently joined in $chancount channels.");

    my $uptime = Time::Seconds->new((time() - $^T));
    $bot->say($chan, "Bot Uptime: ".$uptime->pretty);
  } else {
    $bot->notice($chan, "Access denied.");
    $bot->log("BotStats: STATUS command denied for $nick.");
  }
}

sub unloader {
  $bot->del_handler('chancmd status', 'BotStats_dostatus');
  $bot->del_handler('chancmd cpuinfo', 'cpuinfo');
  $help->del_help('status', 'Admin');
}

1;
