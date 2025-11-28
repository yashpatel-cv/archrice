#!/bin/sh

# Archrice installer - minimal dotfiles deployment
# Usage: curl -LO https://raw.githubusercontent.com/yashpatel-01/archrice/master/install.sh && sh install.sh

set -e

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/yashpatel-01/archrice.git}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.local/src/archrice}"
PROGS_FILE="${PROGS_FILE:-$DOTFILES_DIR/progs.csv}"
AUR_HELPER="${AUR_HELPER:-yay}"

echo "==================================================="
echo "  Archrice Dotfiles Installer"
echo "==================================================="
echo ""
echo "This will:"
echo "  1. Clone archrice dotfiles to $DOTFILES_DIR"
echo "  2. Install packages from progs.csv (if present)"
echo "  3. Deploy dotfiles to your home directory"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

# Check if running as root
if [ "$(id -u)" = 0 ]; then
    echo "Error: Do not run this script as root."
    exit 1
fi

# Clone or update dotfiles repo
if [ -d "$DOTFILES_DIR" ]; then
    echo "==> Updating existing archrice repo..."
    cd "$DOTFILES_DIR"
    git pull
else
    echo "==> Cloning archrice repo..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# Install packages from progs.csv if it exists
if [ -f "$PROGS_FILE" ]; then
    echo ""
    echo "==> Installing packages from progs.csv..."
    
    # Check if AUR helper is installed for AUR packages
    if ! command -v "$AUR_HELPER" >/dev/null 2>&1; then
        echo "Warning: AUR helper '$AUR_HELPER' not found. Skipping AUR packages."
        echo "Install yay first: sudo pacman -S --needed base-devel git && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
    fi
    
    while IFS=, read -r tag program comment; do
        # Skip comments and empty lines
        case "$tag" in
            \#*|'') continue ;;
        esac
        
        case "$tag" in
            A)  # AUR package
                if command -v "$AUR_HELPER" >/dev/null 2>&1; then
                    echo "Installing AUR: $program"
                    $AUR_HELPER -S --needed --noconfirm "$program" || echo "Failed to install $program"
                fi
                ;;
            G)  # Git repo (suckless programs)
                echo "Building from source: $program"
                repo_dir="$HOME/.local/src/$(basename "$program" .git)"
                if [ -d "$repo_dir" ]; then
                    cd "$repo_dir" && git pull
                else
                    git clone "$program" "$repo_dir"
                    cd "$repo_dir"
                fi
                sudo make clean install || echo "Failed to build $program"
                cd "$DOTFILES_DIR"
                ;;
            *)  # Regular package
                echo "Installing: $program"
                sudo pacman -S --needed --noconfirm "$program" || echo "Failed to install $program"
                ;;
        esac
    done < "$PROGS_FILE"
fi

# Deploy dotfiles
echo ""
echo "==> Deploying dotfiles to $HOME..."

# Use rsync if available, otherwise cp
if command -v rsync >/dev/null 2>&1; then
    rsync -av --exclude='.git' --exclude='README.md' --exclude='progs.csv' --exclude='install.sh' "$DOTFILES_DIR/" "$HOME/"
else
    cp -rfT "$DOTFILES_DIR" "$HOME"
fi

echo ""
echo "==================================================="
echo "  ✓ Archrice installation complete!"
echo "==================================================="
echo ""
echo "Next steps:"
echo "  1. Log out and log back in (or run: source ~/.zprofile)"
echo "  2. Start dwm: startx (if not already running)"
echo "  3. Customize configs in ~/.config/"
echo ""
