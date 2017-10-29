# Light, a fork from a flexable modulated IRC bot called Shadow

-(Shadow)- The modular IRC bot written in Perl, created by ablakely 

This here is a fork that focuses on module development, a collection of modules along with a few others for the original Shadow IRC Bot. These modules are able to be loaded and unload via command or manually added through the bots configuration file ( /etc/shadow.conf or /etc/shadow.conf.example if you have not already renamed the file)

- Official Shadow Bot Repo:<b> https://github.com/ablakely/shadow </b>

# Prerequisites

Newly Added:

- Sys::Info
- File::RandomLine
- IRC::Toolkit::Colors

Previous Prerequisites:

- Shadow::Core;
- Shadow::Help;
- JSON
- POSIX
- Proc::ProcessTable
- Time::Seconds
- warnings
- Mojo::IOLoop
- Mojo::UserAgent
- XML::Feed
- LWP::UserAgent


# Newly Added Modules:

- <b>NoAllah.pm</b> - This module was created to take care of the excessive spamming of religious propaganda within our channhels, although it is pretty strict, a more refined version will be created that more accurately detects if they are in fact spamming or have a discussion about islam. Once more refined it will be less likely to kick/ban a user who was merely using the word allah with no relation to spam at all.

- <b>iSeen.pm</b> - This is a new module under development that allows users to check when other frequent users were last online. It will provide the time, date and channel the user was last seen on by Light. Channel/Privatemsg Usage: .seen (nickname) 

- <b>Quotes.pm</b> - This module responds with a random quote from "<bot dir>/quotes" when user types ".quote". ".addquote" will be added as a function in the future.
  
- <b>Insults.pm</b> - This module insults a user you specify with a random line from "./insults". Usage .insult (nick)

- <b>TXTctrl.pm</b> - Used to send text to channels or to users via private message. Usage (in private chat): tc (c/p) (channel/nick) (message) ==incomplete mod==

- <b>Welcome.pm</b> - This mod sends a welcome message to channel if anyone that joins. Usage via private message:<b> tc (c/p) (channel/nick) (message)</b> 

# Modules that came standard with Shadow with changes:
- <b>Autojoin.pm</b>
- <b>BotStats.pm</b>
- <b>ChanOP.pm</b> - Added ".mode" function, Usage - <b>.mode (channel) (mode) (username)</b>
- <b>RSS.pm</b> - Added color to feed output to channel / added optional interval setting to rss add function / created space between url link and [] brackets so webclients detect url with less issues.
- <b>URLIdentifier.pm</b> 
- <b>Uptime.pm</b>
