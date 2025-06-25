#!/bin/bash

# Check if we're already in a tmux session
if [ -n "$TMUX" ]; then
    echo "Already in a tmux session"
    exit 0
fi

# Get list of existing sessions
sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

if [ -z "$sessions" ]; then
    # No sessions exist, create a new one
    echo "No existing sessions found. Creating new session..."
    read -p "Enter session name (default: main): " session_name
    session_name=${session_name:-main}
    tmux new-session -s "$session_name"
else
    # Sessions exist, show menu
    echo "Existing tmux sessions:"
    echo "$sessions" | nl -w2 -s') '
    echo "0) Create new session"
    echo
    read -p "Select session (number) or press Enter for new: " choice
    
    if [ -z "$choice" ] || [ "$choice" = "0" ]; then
        # Create new session
        read -p "Enter new session name: " session_name
        if [ -n "$session_name" ]; then
            tmux new-session -s "$session_name"
        else
            echo "Session name cannot be empty"
            exit 1
        fi
    else
        # Join existing session
        session_name=$(echo "$sessions" | sed -n "${choice}p")
        if [ -n "$session_name" ]; then
            tmux attach-session -t "$session_name"
        else
            echo "Invalid selection"
            exit 1
        fi
    fi
fi