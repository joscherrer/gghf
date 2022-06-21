# GGHF : Global Git Hooks Fallback

You want to use the configuration variable `core.hooksPath` but don't want to lose the ability to run local hooks ?
Then your are in the right place. GGHF will make your global hooks call your local hooks automatically.

## Setup

Clone this repository where you see fit. I recommend `$XDG_CONFIG_HOME/git/gghf`.

```bash
git clone git@github.com:joscherrer/gghf.git ${XDG_CONFIG_HOME:-$HOME/.config}/git/gghf
```

Configure `core.hooksPath`
```bash
git config --global core.hooksPath ${XDG_CONFIG_HOME:-~/.config}/git/gghf/hooks
```

Then you can :
- Create global hooks in `${XDG_CONFIG_HOME:-~/.config}/git/hooks/`
- Create local hooks in `.git/hooks/`

