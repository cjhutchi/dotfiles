if command -v gem >/dev/null 2>&1; then
    echo "--- Installing bundle_update_interactive ---"
    gem install bundle_update_interactive --user-install
    
    # Dynamically adds the Ruby user gem bin directory to your PATH if it isn't there
    USER_GEM_BIN=$(ruby -e 'puts Gem.user_dir')/bin
    if [ -d "$USER_GEM_BIN" ]; then
        # Append to bashrc/zshrc so it persists in your terminal sessions
        echo "export PATH=\"\$PATH:$USER_GEM_BIN\"" >> ~/.bashrc
        echo "export PATH=\"\$PATH:$USER_GEM_BIN\"" >> ~/.zshrc
        # Update current script PATH so it's immediately usable if needed
        export PATH="$PATH:$USER_GEM_BIN"
    fi
else
    echo "Skipping bundle-update-interactive: Ruby/RubyGems not found in this Codespace."
fi
