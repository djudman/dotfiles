* .zprofile
  .zlogin and .zprofile are basically the same thing - they set the
  environment for login shells; they just get loaded at different 
  times (see below). 
  .zprofile is based on the Bash's .bash_profile while .zlogin is
  a derivative of CSH's .login. Since Bash was the default shell
  for everything up to Mojave, stick with .zprofile.
* .zshrc
  This sets the environment for interactive shells. This gets
  loaded after .zprofile. It's typically a place where you
  "set it and forget it" type of parameters like $PATH, $PROMPT,
  aliases, and functions you would like to have in both login
  and interactive shells.
* :

.zshenv → .zprofile → .zshrc → .zlogin → .zlogout
