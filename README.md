# 🏠 dotfiles

![Last Commit](<https://img.shields.io/github/last-commit/mikelorant/dotfiles>)
![License](<https://img.shields.io/github/license/mikelorant/dotfiles>)
![Repo Size](<https://img.shields.io/github/repo-size/mikelorant/dotfiles>)

This is where I keep the configuration for setting up a functional macOS
environment. I have tailored the setup for working in the devops space with a
clear focus on the terminal.

It is never too useful to install someone elses dotfiles, however there is a
lot that can be discovered just by browsing the code. I hope the code I have
shared help others build their own dotfiles and inspire ideas of useful tools,
interesting settings or just different methods for creating a reproducable and
maintainable environment.

![](<https://d.pr/i/eCHQ6k.gif>)

 * [<g-emoji class="g-emoji" alias="book" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4d6.png">📖</g-emoji> Story](#-story)
 * [<g-emoji class="g-emoji" alias="trophy" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f3c6.png">🏆</g-emoji> Improvements](#-improvements)
 * [<g-emoji class="g-emoji" alias="hammer_and_wrench" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f6e0.png">🛠</g-emoji> Tools](#-tools)
 * [<g-emoji class="g-emoji" alias="rocket" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f680.png">🚀</g-emoji> Installation](#-installation)
 * [<g-emoji class="g-emoji" alias="rainbow" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f308.png">🌈</g-emoji> Customisation](#-customisation)
 * [<g-emoji class="g-emoji" alias="memo" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4dd.png">📝</g-emoji> License](#-license)
 * [<g-emoji class="g-emoji" alias="flashlight" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f526.png">🔦</g-emoji> About](#-about)

## 📖 Story

It is helpful to explain why I shared this repository and what I have learned
over the many years maintaining it.

As someone who works in the system automation space, I have an inherent belief
that storing configuration that can be repeated provides a better and more
reliable system.

While I always stored my configuration as code, it wasn't until recently that I
recognised the benefits of reviewing and refreshing the tools and workflow
practises we so commonly have become acustomed to.

It has become quite clear that improving your digital working environment can
have a profound improvement in productivity and development happiness. Adding
intelligence to our tools we use daily can dramatically reduce the amount of
effort and typing necessary especially when working in a command line
environment.

## 🏆 Improvements

There are a few notable changes that I consider worthwhile to highlight. These
are improvements that have such an impact on workflow that I now consider them
impossible to live without.

- Directory navigation using an autojump style tool such as [autojump](<https://github.com/wting/autojump>), [z](<https://github.com/rupa/z>) or [zoxide](<https://github.com/ajeetdsouza/zoxide>).
- [Fish](<https://fishshell.com/>) style autosuggestions with the [zsh-autosuggestions](<https://github.com/zsh-users/zsh-autosuggestions>) plugin.
- Prompt segments with [Powerlevel10k](<https://github.com/romkatv/powerlevel10k>) theme.
- Extensive use of tab completion for commands, arguments and directory navigation.
- Integration of [fzf](<https://github.com/junegunn/fzf>) into most commands for fuzzy finding.

## 🛠 Tools

While most dotfiles have similar applications installed it is useful to point
out some of the differences or lesser known commands that I have discovered and
predominantly use.

- [LSD](<https://github.com/Peltoche/lsd>) is a modern replacement for the familar `ls`.
- [Delta](<https://github.com/dandavison/delta>) is an evolution of `diff`.
- [Bat](<https://github.com/sharkdp/bat>) is a replacement for both `cat` and `less`.
- [Gitmoji](<https://github.com/carloscuesta/gitmoji>) is both a convenient and fun way to improvement [Git](<https://git-scm.com/>) commit quality.
- [Zoxide](<https://github.com/ajeetdsouza/zoxide>) is an alternative directory traversal method to the traditional `cd`.

One clearly common theme in these tools is the the addition of colour and
glyphs to help improve readability. It is hard to appreciate how much of a
difference this adds until you become used to the changes.

Of all the changes, the most significant impact has been the addition of
autojump capability. Nothing has improved my experience as much as installing
[Zoxide](<https://github.com/ajeetdsouza/zoxide>).

## 🚀 Installation

Installation is broken down into a few components:

1. Install [Fresh](<https://github.com/freshshell/fresh>) to manage the shell configuration.
1. Install Xcode Command Line Developer tools.
1. Install [Homebrew](<https://brew.sh/>) package manager.
1. Install my recommended applications and configure them.

Setting all of this up follows the standard method of running a script over the
Internet. Have a read of the script to see what it does as it is never wise to
just blindly trust someone elses code.

```shell
/usr/bin/env bash -c "$(curl -sL https://raw.githubusercontent.com/mikelorant/dotfiles/master/install.sh)"
```

## 🌈 Customisation

Practically everything can be changed however the majority of the improvements
apply to a few of the core applications installed:

- [Zsh](<https://www.zsh.org/>) with [Powerlevel10k](<https://github.com/romkatv/powerlevel10k>)
- [iTerm2](<https://www.iterm2.com/>)
- [Atom](<https://atom.io/>)
- [Nano](<https://www.nano-editor.org/>)
- [Git](<https://git-scm.com/>)

These applications are what I use the most so it makes sense to tweak them to
help improve my productivity.

## 📝 License

This repository is licensed under [Creative Commons Zero v1.0 Universal](<https://creativecommons.org/publicdomain/zero/1.0/>).

## 🔦 About

Powered by [Fresh](<https://github.com/freshshell/fresh>).
