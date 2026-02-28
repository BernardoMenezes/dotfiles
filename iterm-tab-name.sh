#!/bin/bash
# Set iTerm2 tab title to the project directory name
# Uses OSC 1 (set tab title) which takes precedence over OSC 0 in iTerm2
DIR_NAME=$(basename "$PWD")
printf "\033]1;Claude: %s\007" "$DIR_NAME" > /dev/tty 2>/dev/null
