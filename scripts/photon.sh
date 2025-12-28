#!/bin/bash

SESSION="dev"
FRONTEND_DIR="$HOME/Documents/dbt/PhotonSmartCoach/frontend"
BACKEND_DIR="$HOME/Documents/dbt/PhotonSmartCoach/backend"
CHAINLIT_DIR="$BACKEND_DIR/src/chatbot"

# Commands to be sent to each window
FRONTEND_CMD="npm run dev"
BACKEND_CMD="source venv/bin/activate && python3.11 src/main.py"
CHAINLIT_CMD="source ../../venv/bin/activate && chainlit run chatbot.py --port 8501 -w"

# Clean up any stale tmux socket to avoid "no server running" error
SOCKET_PATH="/private/tmp/tmux-$UID"
if [ -d "$SOCKET_PATH" ]; then
  echo "Cleaning up stale tmux socket at $SOCKET_PATH"
  rm -rf "$SOCKET_PATH"
fi

# Kill old session if exists
tmux has-session -t $SESSION 2>/dev/null && tmux kill-session -t $SESSION

echo "Starting new tmux session: $SESSION"

# Ensure tmux server is running and set options
tmux start-server
tmux set-option -g remain-on-exit on
tmux set-option -g destroy-unattached off

# --- FRONTEND ---
tmux new-session -d -s $SESSION -n "frontend" -c "$FRONTEND_DIR" "/bin/zsh"
tmux send-keys -t $SESSION:frontend "$FRONTEND_CMD" C-m

# --- BACKEND ---
tmux new-window -t $SESSION -n "backend" -c "$BACKEND_DIR" "/bin/zsh"
tmux send-keys -t $SESSION:backend "$BACKEND_CMD" C-m

# --- CHATBOT ---
tmux new-window -t $SESSION -n "chatbot" -c "$CHAINLIT_DIR" "/bin/zsh"
tmux send-keys -t $SESSION:chatbot "$CHAINLIT_CMD" C-m

# Debug: List windows to verify creation
echo "Verifying tmux windows for session $SESSION"
tmux list-windows -t $SESSION

# Attach to frontend window
tmux select-window -t $SESSION:0
tmux attach-session -t $SESSION || {
  echo "Failed to attach to session $SESSION. Check if session exists:"
  tmux list-sessions
  exit 1
}
