#!/usr/bin/env sh

CMD="/usr/libexec/PlistBuddy -c"
FILE="~/Library/Preferences/com.googlecode.iterm2.plist"

# Allow sessions to survive logging out and back in.
# This breaks the “auth sufficient pam_tid.so” hack some people use to allow sudo to authenticate with Touch ID.
defaults write com.googlecode.iterm2 bootstrapDaemon -bool false

# Disable metal renderer when idle to save CPU utilization.
defaults write com.googlecode.iterm2 disableMetalWhenIdle -bool true

# Terminal windows resize smoothly. Disables snapping to character grid.
# Necessary for applications that manage windows and their sizes such as Rectangle.
defaults write com.googlecode.iterm2 disableWindowSizeSnap -bool true

# Automatically check for new versions of iTerm2.
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool false

# Use adaptive framerate. When throughput is low, the screen will update at 60 frames per second.
# When throughput is higher, it will drop to a configurable rate (15 fps by default).
# defaults write com.googlecode.iterm2 UseAdaptiveFrameRate -bool false

# New Bookmarks
${CMD} "Add :'New Bookmarks' array" ${FILE}

# Use built-in Powerline glyphs.
${CMD} "Add :'New Bookmarks':0:'Draw Powerline Glyphs' bool true" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Non Ascii Font' string JetBrainsMonoNerdFontComplete-Regular 12" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Normal Font' string JetBrainsMono-Regular 12" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Show Mark Indicators' bool false" ${FILE}
# Unlimited Scrollback
${CMD} "Add :'New Bookmarks':0:'Unlimited Scrollback' bool true" ${FILE}
# Window Type: (15) Maximized
${CMD} "Add :'New Bookmarks':0:'Window Type' integer 15" ${FILE}

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

# Show Status Bar
# Enable this in future revisions.
# ${CMD} "Delete :'New Bookmarks':0:'Show Status Bar'" ${FILE}
# ${CMD} "Add :'New Bookmarks':0:'Show Status Bar' bool true" ${FILE}

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
