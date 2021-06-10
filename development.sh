tmux has-session -t development
if [ $? != 0 ]; then
   tmux new -s development -n editor -d
   tmux send-keys -t development 'cd  ~/Dropbox/SyncedFiles/Codes/Github' C-m
   tmux send-keys -t development 'nvim' C-m
   tmux split-window -v -p 30 -t development
   tmux split-window -h -t development:0.1
   tmux send-keys -t development:0.1 'cd  ~/Dropbox/SyncedFiles/Codes/Github' C-m
   tmux send-keys -t development:0.2 'cd  ~/Dropbox/SyncedFiles/Codes/Github' C-m
   tmux send-keys -t development:0.1 'universidad; ipython' C-m
   tmux select-window -t development:0
   tmux select-pane -t development:editor.0
fi
tmux attach -t development
