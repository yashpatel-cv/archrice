# The Voidrice (Patel <https://lukesmith.xyz>'s dotfiles)

These are the dotfiles deployed by [LARBS](https://larbs.xyz) and as seen on
[my YouTube channel](https://youtube.com/c/lukesmithxyz).

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

These dotfiles are intended to go with numerous suckless programs I use:

- [dwm](https://github.com/lukesmithxyz/dwm) (window manager)
- [dwmblocks](https://github.com/lukesmithxyz/dwmblocks) (statusbar)
- [st](https://github.com/lukesmithxyz/st) (terminal emulator)

I also recommend trying out
[mutt-wizard](https://github.com/lukesmithxyz/mutt-wizard), which additionally
works with this setup. It gives you an easy-to-install terminal-based email
client regardless of your email provider. It is integrated into these dotfiles
as well.

## Install these dotfiles and all dependencies

Use [LARBS](https://larbs.xyz) to autoinstall everything:

```
curl -LO larbs.xyz/larbs.sh
```

or clone the repo files directly to your home directory and install the
[dependencies](https://github.com/LukeSmithxyz/LARBS/blob/master/static/progs.csv).

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
