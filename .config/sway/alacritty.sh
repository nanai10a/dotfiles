find $XDG_RUNTIME_DIR -maxdepth 1 -type s -name 'Alacritty-"*-*-*.sock' -exec /bin/sh -c 'exit 1' {} + -quit && alacritty msg create-window || alacritty
