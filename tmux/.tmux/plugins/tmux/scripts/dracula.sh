#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

main()
{
  datafile=/tmp/.dracula-tmux-data

  # set configuration option variables
  show_fahrenheit=$(get_tmux_option "@dracula-show-fahrenheit" true)
  show_location=$(get_tmux_option "@dracula-show-location" true)
  show_powerline=$(get_tmux_option "@dracula-show-powerline" false)
  show_flags=$(get_tmux_option "@dracula-show-flags" false)
  show_left_icon=$(get_tmux_option "@dracula-show-left-icon" smiley)
  show_left_icon_padding=$(get_tmux_option "@dracula-left-icon-padding" 1)
  show_military=$(get_tmux_option "@dracula-military-time" false)
  show_timezone=$(get_tmux_option "@dracula-show-timezone" true)
  show_left_sep=$(get_tmux_option "@dracula-show-left-sep" )
  show_right_sep=$(get_tmux_option "@dracula-show-right-sep" )
  show_border_contrast=$(get_tmux_option "@dracula-border-contrast" false)
  show_day_month=$(get_tmux_option "@dracula-day-month" false)
  show_refresh=$(get_tmux_option "@dracula-refresh-rate" 5)
  IFS=' ' read -r -a plugins <<< $(get_tmux_option "@dracula-plugins" "battery network weather")

  # Dracula Color Pallette
  white='#f8f8f2'
  gray='#44475a'
  dark_gray='#282a36'
  light_purple='#bd93f9'
  dark_purple='#6272a4'
  cyan='#8be9fd'
  green='#50fa7b'
  orange='#ffb86c'
  red='#ff5555'
  pink='#ff79c6'
  yellow='#f1fa8c'

  # Handle left icon configuration
  case $show_left_icon in
    smiley)
      left_icon="☺ #S";;
    session)
      left_icon="#S";;
    window)
      left_icon="#W";;
    *)
      left_icon=$show_left_icon;;
  esac

  # Handle left icon padding
  padding=""
  if [ "$show_left_icon_padding" -gt "0" ]; then
    padding="$(printf '%*s' $show_left_icon_padding)"
  fi
  left_icon="$left_icon$padding"

  # Handle powerline option
  if $show_powerline; then
    right_sep="$show_right_sep"
    left_sep="$show_left_sep"
  fi

  # start weather script in background
  if [[ "${plugins[@]}" =~ "weather" ]]; then
    $current_dir/sleep_weather.sh $show_fahrenheit $show_location &
  fi

  # Set timezone unless hidden by configuration
  case $show_timezone in
    false)
      timezone="";;
    true)
      timezone="#(date +%Z)";;
  esac

  case $show_flags in
    false)
      flags=""
      current_flags="";;
    true)
      flags="#{?window_flags,#[fg=${dark_purple}]#{window_flags},}"
      current_flags="#{?window_flags,#[fg=${light_purple}]#{window_flags},}"
  esac

  # sets refresh interval to every 5 seconds
  tmux set-option -g status-interval $show_refresh

  # set the prefix + t time format
  if $show_military; then
    tmux set-option -g clock-mode-style 24
  else
    tmux set-option -g clock-mode-style 12
  fi

  # set length
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 150

  # pane border styling
  if $show_border_contrast; then
    tmux set-option -g pane-active-border-style "fg=${light_purple}"
  else
    tmux set-option -g pane-active-border-style "fg=${dark_purple}"
  fi
  tmux set-option -g pane-border-style "fg=${gray}"

  # message styling
  tmux set-option -g message-style "bg=${gray},fg=${white}"

  # status bar
  tmux set-option -g status-style "bg=${dark_gray},fg=${white}"

  # Status left
  if $show_powerline; then
    tmux set-option -g status-left "#[bg=${dark_gray},fg=${dark_purple}]#{?client_prefix,#[bg=${green}],} ${left_icon} #[fg=${dark_purple},bg=${dark_gray}]#{?client_prefix,#[fg=${green}],}${left_sep}"
    powerbg=${gray}
  else
    tmux set-option -g status-left "#[bg=${dark_gray},fg=${dark_purple}]#{?client_prefix,#[bg=${green}],} ${left_icon}"
  fi

  # Status right
  tmux set-option -g status-right ""

  for plugin in "${plugins[@]}"; do

    if [ $plugin = "git" ]; then
      IFS=' ' read -r -a colors  <<< $(get_tmux_option "@dracula-git-colors" "dark_gray green")
        script="#($current_dir/git.sh)"
    fi

    if [ $plugin = "battery" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@dracula-battery-colors" "dark_gray pink ")
      script="#($current_dir/battery.sh)"
    fi

    if [ $plugin = "gpu-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@dracula-gpu-usage-colors" "dark_gray pink")
      script="#($current_dir/gpu_usage.sh)"
    fi

    if [ $plugin = "cpu-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@dracula-cpu-usage-colors" "dark_gray orange ")
      script="#($current_dir/cpu_info.sh)"
    fi

    if [ $plugin = "ram-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@dracula-ram-usage-colors" "dark_gray dark_purple")
      script="#($current_dir/ram_info.sh)"
    fi

    if [ $plugin = "time" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@dracula-time-colors" "dark_gray cyan")
      # script="%a %m/%d %I:%M %p ${timezone} "
      script="%a %d/%m %R"
    fi

    if $show_powerline; then
      tmux set-option -ga status-right "#[fg=${!colors[0]},bg=${powerbg},nobold,nounderscore,noitalics]${right_sep}#[fg=${!colors[1]},bg=${!colors[0]}] $script "
      powerbg=${!colors[0]}
    else
      tmux set-option -ga status-right "#[fg=${!colors[1]},bg=${!colors[0]}] $script "
    fi
  done

  # Window option
  if $show_powerline; then
    tmux set-window-option -g window-status-current-format "#[fg=${dark_gray},bg=${light_purple}]${left_sep}#[fg=${dark_gray},bg=${light_purple}] #I #W${current_flags} #[fg=${dark_gray},bg=${light_purple}]${left_sep}"
  else
    tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${dark_purple}] #I #W${current_flags} "

  fi

  tmux set-window-option -g window-status-format "#[fg=${light_purple}]#[bg=${dark_gray}] #I #W${flags} "
  tmux set-window-option -g window-status-activity-style "bold"
  tmux set-window-option -g window-status-bell-style "bold"
}

# run main function
main
