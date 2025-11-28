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

Quick install (similar to LARBS):

```bash
curl -LO https://raw.githubusercontent.com/yashpatel-01/PARSS/main/scripts/arch-secure-deploy.sh
# Run Phase 14 for desktop setup (includes archrice deployment)
```

Or use [LARBS](https://larbs.xyz) to autoinstall everything:

```bash
curl -LO larbs.xyz/larbs.sh
# Then run: bash larbs.sh
```

Or manually clone and install:

```bash
git clone https://github.com/yashpatel-01/archrice.git
cd archrice
# Install dependencies from progs.csv (see PARSS or LARBS for automated installation)
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
