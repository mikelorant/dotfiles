#!/usr/bin/env bash

defaults write com.apple.dock ResetLaunchPad -bool true

killall Dock -QUIT
