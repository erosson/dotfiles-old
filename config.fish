set PATH (yarn global bin) ~/bin ~/.local/bin /usr/local/go/bin ~/Downloads/flex-sdk/bin $PATH ~/.gem/ruby/2.5.0/bin

# disable while internet's unavailable. TODO: we should stop this from breaking automatically
#. ~/.auth.env

# https://stackoverflow.com/a/25200448
# gnu screen titles
function preexec --on-event fish_preexec
  set dargv $argv "" ""
  #echo "hello $dargv[1] $dargv[2]"
  echo -ne "\ek$dargv[1] $dargv[2]\e\\"
end
function postexec --on-event fish_postexec
  echo -ne '\ekfish\e\\'
end


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/home/evan/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/evan/Downloads/google-cloud-sdk/path.fish.inc'; end
