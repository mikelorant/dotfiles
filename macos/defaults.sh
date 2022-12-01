#!/usr/bin/env bash

defaults -currentHost write -glocalDomain CGFontRenderingFontSmoothingDisabled -bool YES

defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

defaults -currentHost write -globalDomain com.apple.swipescrolldirection -bool NO

defaults write com.apple.finder "_FXSortFoldersFirst" -bool "false" && killall Finder
