extensions=(
	"shardulm94.trailing-spaces",
	"ms-python.debugpy",
	"ms-toolsai.jupyter-keymap",
	"ms-toolsai.vscode-jupyter-slideshow",
	"ms-toolsai.vscode-jupyter-cell-tags",
	"ms-toolsai.jupyter",
	"ms-ceintl.vscode-language-pack-ru",
	"ms-toolsai.jupyter-renderers",
	"ms-python.python",
	"pkief.material-icon-theme",
	"ms-python.vscode-pylance"
)

installed_extensions=$(code --list-extensions)

for extension in "${extensions[@]}"; do
    if echo "$installed_extensions" | grep -qi "^$extension$"; then
        echo "$extension is already installed. Skipping..."
    else
        echo "Installing $extension..."
        code --install-extension "$extension"
    fi
done

echo "VS Code extensions have been installed."

# Define the target directory for VS Code user settings on macOS
VSCODE_USER_SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"

# Check if VS Code settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Copy your custom settings.json and keybindings.json to the VS Code settings directory
    ln -sf "${HOME}/dotfiles/settings/VSCode-Settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"

    echo "VS Code settings have been updated."
else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi

# Open VS Code to sign-in to extensions
code .