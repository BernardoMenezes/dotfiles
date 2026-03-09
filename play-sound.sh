#!/bin/bash
# Play a Claude Code sound, respecting the TOGGLE file.
# Usage: play-sound.sh <sound-file>

TOGGLE_FILE="$HOME/.claude/hooks/TOGGLE"
SOUND_FILE="$1"

if [[ -z "$SOUND_FILE" ]]; then
  exit 0
fi

# Check toggle - only play if TOGGLE is "1"
if [[ "$(cat "$TOGGLE_FILE" 2>/dev/null)" != "1" ]]; then
  exit 0
fi

nice -n 20 afplay "$SOUND_FILE" &
