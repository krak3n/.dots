# Source virtual fish

set -g VIRTUALFISH_COMPAT_ALIASES
. $HOME/.dots/fish/virtual.fish

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

# Prompt
function fish_prompt

  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l magenta (set_color magenta)
  set -l normal (set_color normal)

  if test $VIRTUAL_ENV
    set_color magenta
    printf "%s " (basename $VIRTUAL_ENV)
    set_color yellow
    printf '⚮  '
    set_color normal
  end

  set_color cyan
  printf '%s' (whoami)
  set_color yellow
  printf ' in '

  set_color blue
  printf '%s' (pwd)
  set_color normal

  # Git
  if [ (_git_branch_name) ]
    set -l git_branch $yellow(_git_branch_name)
    set git_info "$magenta ~ $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty "$red ●"
      set git_info "$git_info$dirty"
    end

    printf "$git_info"
    set_color normal
  end

  # Line 2
  echo
  set_color yellow
  printf '↳  '
  set_color normal

end
