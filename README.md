# GGHF : Global Git Hooks Fallback

You want to use the configuration variable `core.hooksPath` but don't want to lose the ability to run local hooks ?  
Then your are in the right place. GGHF will make your global hooks call your local hooks automatically.

## Setup

Clone this repository where you see fit. I recommend `$XDG_CONFIG_HOME/git/gghf`.

```bash
git clone git@github.com:joscherrer/gghf.git ${XDG_CONFIG_HOME:-$HOME/.config}/git/gghf
```

Configure GGHF hooks as the default hooks with the git variable `core.hooksPath`.
```bash
git config --global core.hooksPath ${XDG_CONFIG_HOME:-~/.config}/git/gghf/hooks
```

Optionnaly configure your custom global hooks with variable `gghf.hooksPath`.
```bash
git config --global gghf.hooksPath ${XDG_CONFIG_HOME:-~/.config}/git/hooks
```

Then you can :
- Create global hooks in `${XDG_CONFIG_HOME:-~/.config}/git/hooks/`
- Create local hooks in `.git/hooks/`

## Configuration

**GGHF** uses several settings, stored in your git config, to configure its behavior.

- `gghf.hooksPath`: Sets the path for your custom global hooks. Default: `${XDG_CONFIG_HOME:-~/.config}/git/hooks`
- `gghf.mode`, Sets the desired mode of operation. Default: `exclusive`
    - `exclusive`, (default), to execute only the first found hook in the order of precedence (see [precedence](#precedence))
    - `chained`, to execute all the hooks one after the other in the order of precedence
- `gghf.reverse`: Reverses the order of precedence. Default: `false`

For example, to configure the mode of operation to `chained` :
```bash
git config --global gghf.mode chained
```

There are also environment variables that can be used :
- `GGHF_DEBUG=1`: to show debug information
- `GGHF_TEST=1`: used only to test GGHF.

## Precedence

To execute your hooks, **GGHF** establishes the following order of precedence (from first to last executed) :
- local hooks, in your `$GIT_DIR` directory
- global hooks, in your `gghf.hooksPath` directory

This order can be reversed by changing the setting `gghf.reverse`.