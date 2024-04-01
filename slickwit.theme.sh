#! bash oh-my-bash.module


function __slickwit_print_title() {
  # Print tab name
  echo -ne "\033];${PWD/*\//}\007";
}

__slickwit_print_title;

_omb_theme_slickwit_prompt_red='\e[0;31m' # Red
# txtred='\e[0;31m' # Red
_omb_theme_slickwit_prompt_green='\e[0;32m' # Green
# bldgrn='\e[1;32m' # Bold Green
# bldpur='\e[1;35m' # Bold Purple
# txtrst='\e[0m'    # Text Reset

function __slickwit_header() {
 printf "===================${_omb_term_bold_teal}${_omb_term_background_black}  $(date "+%A, %b %d, %Y")  ${_omb_term_reset}===================${_omb_term_reset}"
}

# Header 
echo $(__slickwit_header)
if [ -d "$HOME/AppData/Roaming/nvm" ]; then
 e_bold "node version: ${_omb_term_underline_lime}$(nvm current)${_omb_term_reset}";
fi


function __slickwit_clock {
  printf "$(clock_prompt): "
}

function __slick_new_tab_same_dir() {
  printf "\e]9;9;%s\e\\" "`cygpath -w "$PWD" -C ANSI`";
  __slickwit_print_title;
}

__slickwit_git_info () {
 git=$(git_current_branch)
 if [ ! -z "$git" ]; then
  printf "${_omb_theme_slickwit_prompt_green} ~ ($(git_current_branch))"
 fi
}

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵" "✨" "🐱‍🏍" "🐱‍🐉" "🐱‍💻" "🍕" "🍟" "🍄" "🏳" "🛸" "🗼" "🌅" "🌄" "🌈" "⚡" "🔥" "💢" "💥" "💯" "☢" "💲" "🔸");


EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]};

function _omb_theme_PROMPT_COMMAND() {
 __slick_new_tab_same_dir
 PS1="\n$(battery_char)$(__slickwit_clock)${_omb_prompt_bold_purple}$PWD$(__slickwit_git_info)"
 PS1+="\n$EMOJI${_omb_prompt_bold_green}→ ${_omb_prompt_reset_color}"
}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$_omb_theme_slickwit_prompt_red"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%I:%M%P"}
_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND