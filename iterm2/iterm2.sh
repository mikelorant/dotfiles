#!/usr/bin/env sh

CMD="/usr/libexec/PlistBuddy -c"
FILE="~/Library/Preferences/com.googlecode.iterm2.plist"

# Scroll wheel sends arrow keys when in alternate screen mode.
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool false

# Allow sessions to survive logging out and back in.
# This breaks the “auth sufficient pam_tid.so” hack some people use to allow sudo to authenticate with Touch ID.
defaults write com.googlecode.iterm2 bootstrapDaemon -bool false

# Disable metal renderer when idle to save CPU utilization.
defaults write com.googlecode.iterm2 disableMetalWhenIdle -bool true

# Terminal windows resize smoothly. Disables snapping to character grid.
defaults write com.googlecode.iterm2 disableWindowSizeSnap -bool true

# HapticFeedbackForEsc
defaults write com.googlecode.iterm2 HapticFeedbackForEsc -bool false

# Hide scroll bars
defaults write com.googlecode.iterm2 HideScrollbar -bool false

# Hide the tab close button // deprecated
defaults write com.googlecode.iterm2 HideTabCloseButton -bool true

# GlobalTouchBarMap
${CMD} "Add :GlobalTouchBarMap:touchbarShared:Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarShared:Label string Shared" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarShared:Text string kubectl config use-context shared\\\n" ${FILE}

${CMD} "Add :GlobalTouchBarMap:touchbarDevelopment:Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarDevelopment:Label string Development" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarDevelopment:Text string kubectl config use-context development\\\n" ${FILE}

${CMD} "Add :GlobalTouchBarMap:touchbarProduction:Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarProduction:Label string Production" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarProduction:Text string kubectl config use-context production\\\n" ${FILE}

${CMD} "Add :GlobalTouchBarMap:touchbarPlaypen:Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarPlaypen:Label string Playpen" ${FILE}
${CMD} "Add :GlobalTouchBarMap:touchbarPlaypen:Text string kubectl config use-context playpen\\\n" ${FILE}

# NSTouchBarConfig: regular
${CMD} "Delete :'NSTouchBarConfig\: regular':CurrentItems" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems array" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:0 string touchbarShared" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:1 string touchbarDevelopment" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:2 string touchbarProduction" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:3 string touchbarPlaypen" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:4 string NSTouchBarItemIdentifierFlexibleSpace" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:5 string iTermTouchBarIdentifierStatus" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:6 string NSTouchBarItemIdentifierOtherItemsProxy" ${FILE}

# New Bookmarks
${CMD} "Add :'New Bookmarks' array" ${FILE}

# If you turn this on, optional ligatures in this font will be enabled.
# It forces iTerm2 to use a slower text rendering algorithm.
${CMD} "Delete :'New Bookmarks':0:'ASCII Ligatures'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'ASCII Ligatures' bool false" ${FILE}

# Use built-in Powerline glyphs.
${CMD} "Delete :'New Bookmarks':0:'Draw Powerline Glyphs'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Draw Powerline Glyphs' bool true" ${FILE}

# Delete all characters left of the cursor
# ⌘ + ←Delete
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x7f-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x7f-0x100000:Text string 0x15" ${FILE}

# Delete all characters right of the cursor
# ⌘ + fn + ←Delete
# ⌘ + Delete→
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf728-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf728-0x100000:Text string 0x0b" ${FILE}

# Delete one word to left of cursor
# ⌥ + ←Delete
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x7f-0x80000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x7f-0x80000:Text string 0x1b 0x08" ${FILE}

# Delete one word to right of cursor
# ⌥ + fn + ←Delete
# ⌥ + Delete→
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf728-0x80000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf728-0x80000:Text string 0x1b 0x64" ${FILE}

# Move cursor to the front of line
# ⌘ + ←
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf702-0x300000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf702-0x300000:Text string 0x01" ${FILE}

# Move cursor to the end of line
# ⌘ + →
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf703-0x300000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0xf703-0x300000:Text string 0x05" ${FILE}

# Undo
# ⌘ + z
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x7a-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x7a-0x100000:Text string 0x1f" ${FILE}

# Redo
# ⇧ + ⌘ + z
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x5a-0x120000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x5a-0x120000:Text string 0x18 0x1f" ${FILE}

# Redo
# ⌘ + y
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x79-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Borkmarks':'Keyboard Maps':0x79-0x100000:Text string 0x18 0x1f" ${FILE}

${CMD} "Delete :'New Bookmarks':0:'Non Ascii Font'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Non Ascii Font' string JetBrainsMonoNerdFontComplete-Regular 12" ${FILE}

${CMD} "Delete :'New Bookmarks':0:'Normal Font'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Normal Font' string JetBrainsMono-Regular 12" ${FILE}

${CMD} "Delete :'New Bookmarks':0:'Scrollback Lines'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Scrollback Lines' integer 0" ${FILE}

${CMD} "Delete :'New Bookmarks':0:'Show Mark Indicators'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Show Mark Indicators' bool false" ${FILE}

# Show Status Bar
# Enable this in future revisions.
${CMD} "Delete :'New Bookmarks':0:'Show Status Bar'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Show Status Bar' bool false" ${FILE}

# Use thin strokes for anti-aliased text.
# (4) On Retina Displays
${CMD} "Delete :'New Bookmarks':0:'Thin Strokes'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Thin Strokes' integer 4" ${FILE}

# Unlimited Scrollback
${CMD} "Delete :'New Bookmarks':0:'Unlimited Scrollback'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Unlimited Scrollback' bool true" ${FILE}

# Use Non-ASCII Font
# The non-ASCII font affects all characters above code point 127.
${CMD} "Delete :'New Bookmarks':0:'Use Non-ASCII Font'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Use Non-ASCII Font' bool true" ${FILE}

# Window Type
# (15) Maximized
${CMD} "Delete :'New Bookmarks':0:'Window Type'" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Window Type' integer 15" ${FILE}

# OpenArrangementAtStartup
# OpenNoWindowsAtStartup
# PasteTabToStringTabStopSize
# SUEnableAutomaticChecks
# ShowFullScreenTabBar
# SoundForEsc
# StatusBarPosition
# TabStyleWithAutomaticOption
# UseAdaptiveFrameRate
# UseBorder
# VisualIndicatorForEsc
# WordCharacters
# findIgnoreCase_iTerm
# findMode_iTerm
# findRegex_iTerm
