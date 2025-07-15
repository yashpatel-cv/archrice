# Archrice - Patel's Arch Linux Dotfiles

Minimalist terminal-centric dotfiles for Arch Linux featuring a suckless software stack (dwm, st, dmenu) with zsh, neovim, and productivity tools.

- Very useful scripts are in `~/.local/bin/`
- Settings for:
	- vim/nvim (text editor)
	- zsh (shell)
	- lf (file manager)
	- mpd/ncmpcpp (music)
	- nsxiv (image/gif viewer)
	- mpv (video player)
	- other stuff like xdg default programs, inputrc and more, etc.
- I try to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.zprofile` to move configs into `~/.config/`
- Bookmarks in text files used by various scripts (like `~/.local/bin/shortcuts`)
	- File bookmarks in `~/.config/shell/bm-files`
	- Directory bookmarks in `~/.config/shell/bm-dirs`

## Usage

These dotfiles are intended to go with suckless programs:

- dwm (window manager)
- dwmblocks (statusbar)
- st (terminal emulator)

Terminal-based email with neomutt and RSS reading with newsboat are configured and ready to use.

## Install these dotfiles and all dependencies

Use [PARSS](https://github.com/yashpatel-01/PARSS) - automated Arch Linux installer with optional archrice deployment:

```bash
curl -LO https://is.gd/parss
# Boot Arch ISO, then run the script and select desktop setup option
```

PARSS installs:
- Complete Arch Linux base system (LUKS2 encryption, BTRFS, security hardening)
- Optional desktop environment (dwm, st, dmenu via Phase 14)
- All packages from archrice/progs.csv
- Archrice dotfiles deployment

For manual dotfiles-only installation on existing Arch systems:

```bash
git clone https://github.com/yashpatel-01/archrice.git ~/.local/src/archrice
cd ~/.local/src/archrice
# Review progs.csv, install packages manually, then copy configs to ~
```

## Pushing Config Changes

After customizing your dotfiles, push changes safely:

1. **Check what changed:**
   ```bash
   git status
   git diff              # Review actual changes
   ```

2. **Stage only config files** (avoid cache/history/binaries):
   ```bash
   git add .config/x11/xresources          # Example: X settings
   git add .config/nvim/init.vim           # Example: Neovim config
   git add .local/bin/your-script          # Example: Custom script
   ```

3. **Commit with clear message:**
   ```bash
   git commit -m "Config: update font size in xresources"
   ```

4. **Push and verify:**
   ```bash
   git push origin master
   git log --oneline -3      # Confirm commit appears
   git status                # Should show "nothing to commit"
   ```

**Files to avoid pushing:**
- Cache: `.cache/*`, `.mozilla/firefox/*/cache2/*`
- History: `.zsh_history`, `.bash_history`, `.lesshst`
- Passwords: `.local/share/password-store/*` (unless encrypted)
- Build artifacts: `*.o`, `*.so`, compiled suckless programs
- Thumbnails: `.thumbnails/*`, `.cache/thumbnails/*`

**Pro tip:** Use `git add -p` to review and stage changes interactively, or `git diff --name-only` to see only filenames.

## Default Desktop Artwork

Thomas Thiemeyer's *The Road to Samarkand* ([fb](https://www.facebook.com/t.thiemeyer/), [insta](https://www.instagram.com/tthiemeyer/), [shop](https://www.redbubble.com/de/people/TThiemeyer/shop))
