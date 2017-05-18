# Statusbar
set -g status-bg colour18

# # Windows Status Bar
set -g window-status-format "#[fg=colour255,bg=colour18] #I  #W "

# # Windows Status Bar (Active Window)
set -g window-status-activity-attr bold
set -g window-status-current-format "#[fg=colour18,bg=colour4]#[fg=colour18,bg=colour4,noreverse,bold] #I  #W #[fg=colour4,bg=colour18,nobold]"

# # Pane Divider Colours
set -g pane-border-fg colour4
set -g pane-active-border-fg white

# # Command Line
set -g message-fg colour255
set -g message-bg colour10
set -g message-attr bold

#
# Format
#

# Status Bar to UTF8
#setw -g utf8 on
#set -g status-utf8 on

# Custom status bar w/ Powerline symbols: █       
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

set -g status-left '#[fg=colour18,bg=colour254,bold] #S #[fg=colour254,bg=colour18,nobold]'
set -g status-right '#[fg=colour255] %R  %d %b #[fg=colour254,bg=colour18,nobold]#[fg=colour18,bg=colour254,bold] #h '
