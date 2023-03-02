# st - the simple (suckless) terminal

The [suckless terminal (st)](https://st.suckless.org/) with some additional features that make it literally the best terminal emulator ever:

## Unique features (using dmenu)

+ **Open the most recent URL** by pressing `Control+Shift+O`
+ **Copy a URL** in the same way with `Control+Shift+L`

This requires placing `externalpipe.sh` in $HOME/.config/st/ and [my build of dmenu](https://github.com/avahe-kellenberger/dmenu)

## Bindings for

+ **scrollback** with `alt-↑/↓` or `alt-pageup/down` or `shift` while scrolling the mouse
+ OR **vim-bindings**: scroll up/down in history with `alt-k` and `alt-j`. Faster with `alt-u`/`alt-d`.
+ **zoom/change font size**: same bindings as above, but holding down shift as well. `alt-home` returns to default
+ **copy text** with `Control+Shift+C`, **paste** is `Control+Shift+V` or `shift-insert`

## Pretty stuff

+ Compatibility with `Xresources` and `pywal` for dynamic colors. The `Xdefaults` file shows a usage example.
+ Default `srcery` colors otherwise.
+ Transparency/alpha, which is also adjustable from your `Xresources`.
+ Default font is system "mono" at 12pt, meaning the font will match your system font.

## Other st patches

+ Vertcenter
+ Scrollback
+ font2
+ updated to latest version 0.8.2
+ boxdraw

## How to configure dynamically with Xresources

For many key variables, this build of `st` will look for X settings set in either `~/.Xdefaults` or `~/.Xresources`. You must run `xrdb` on one of these files to load the settings.

For example, you can define your desired fonts, transparency or colors:

```
*.font:	Liberation Mono:pixelsize=12:antialias=true:autohint=true;
*.alpha: 0.9
*.color0: #111
...
```

The `alpha` value (for transparency) goes from `0` (transparent) to `1` (opaque).

### Colors

To be clear about the color settings:

- This build will use gruvbox colors by default and as a fallback.
- If there are Xresources colors defined, those will take priority.
- But if `wal` has run in your session, its colors will take priority.

Note that when you run `wal`, it will negate the transparency of existing windows, but new windows will continue with the previously defined transparency.

## Notes on Emojis and Special Characters

If st crashes when viewing emojis, install [libxft-bgra](https://aur.archlinux.org/packages/libxft-bgra/) from the AUR.

Note that some special characters may appear truncated if too wide. You might want to manually set your prefered emoji/special character font to a lower size in the `config.h` file to avoid this. By default, JoyPixels is used at a smaller size than the usual text.

