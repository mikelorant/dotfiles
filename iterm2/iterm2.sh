#!/usr/bin/env sh

DELETE=false
INIT=false
for arg in "$@"
do
  case $arg in
    -d|--delete)
    DELETE=true
    INIT=true
    shift
    ;;
    -i|--init)
    INIT=true
    shift
    ;;
  esac
done

if ${DELETE}; then
  # Remove existing config.
  defaults delete com.googlecode.iterm2
  defaults delete com.googlecode.iterm2.private
  rm -rf "${HOME}/Library/Caches/com.googlecode.iterm2"
  rm -rf "${HOME}/Library/Saved Application State/com.googlecode.iterm2.savedState"
  rm -rf "${HOME}/Library/Application Support/iTerm2"
fi

# Config must be generated before these settings can be applied.
if ${INIT}; then
  # Start iTerm2
  /Applications/iTerm.app/Contents/MacOS/iTerm2 &
  # Wait for iTerm2 to start
  sleep 5
  # Quit iTerm2
  osascript -e 'quit app "iTerm2"'
fi

CMD="/usr/libexec/PlistBuddy -c"
FILE="${HOME}/Library/Preferences/com.googlecode.iterm2.plist"

GUID=$( ${CMD} "print :'New Bookmarks':0:Guid" ${FILE} )

# Allow sessions to survive logging out and back in.
# This breaks the “auth sufficient pam_tid.so” hack some people use to allow sudo to authenticate with Touch ID.
defaults write com.googlecode.iterm2 BootstrapDaemon -bool false

# Disable metal renderer when idle to save CPU utilization.
defaults write com.googlecode.iterm2 DisableMetalWhenIdle -bool true

# Terminal windows resize smoothly. Disables snapping to character grid.
# Necessary for applications that manage windows and their sizes such as Rectangle.
defaults write com.googlecode.iterm2 DisableWindowSizeSnap -bool true

# Automatically check for new versions of iTerm2.
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool false

# NeverWarnAboutShortLivedSessions
defaults write com.googlecode.iterm2 NeverWarnAboutShortLivedSessions_${GUID} -bool true

# Use adaptive framerate. When throughput is low, the screen will update at 60 frames per second.
# When throughput is higher, it will drop to a configurable rate (15 fps by default).
# defaults write com.googlecode.iterm2 UseAdaptiveFrameRate -bool false

# New Bookmarks
${CMD} "Add :'New Bookmarks' array" ${FILE} 2>/dev/null

# Use built-in Powerline glyphs.
${CMD} "Delete :'New Bookmarks':0:'Draw Powerline Glyphs'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Draw Powerline Glyphs' bool true" ${FILE}
${CMD} "Delete :'New Bookmarks':0:'Non Ascii Font'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Non Ascii Font' string JetBrainsMonoNerdFontComplete-Regular 12" ${FILE}
${CMD} "Delete :'New Bookmarks':0:'Normal Font'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Normal Font' string JetBrainsMono-Regular 12" ${FILE}
# Use Non-ASCII Font
# The non-ASCII font affects all characters above code point 127.
${CMD} "Delete :'New Bookmarks':0:'Use Non-ASCII Font'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Use Non-ASCII Font' bool true" ${FILE}
${CMD} "Delete :'New Bookmarks':0:'Show Mark Indicators'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Show Mark Indicators' bool false" ${FILE}
# Unlimited Scrollback
${CMD} "Delete :'New Bookmarks':0:'Unlimited Scrollback'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Unlimited Scrollback' bool true" ${FILE}
# Window Type: (15) Maximized
${CMD} "Delete :'New Bookmarks':0:'Window Type'" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Window Type' integer 15" ${FILE}

# Delete all characters left of the cursor
# ⌘ + ←Delete
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0x7f-0x100000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x7f-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x7f-0x100000:Text string 0x15" ${FILE}

# Delete all characters right of the cursor
# ⌘ + fn + ←Delete
# ⌘ + Delete→
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0xf728-0x100000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf728-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf728-0x100000:Text string 0x0b" ${FILE}

# Delete one word to left of cursor
# ⌥ + ←Delete
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0x7f-0x80000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x7f-0x80000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x7f-0x80000:Text string 0x1b 0x08" ${FILE}

# Delete one word to right of cursor
# ⌥ + fn + ←Delete
# ⌥ + Delete→
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0xf728-0x80000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf728-0x80000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf728-0x80000:Text string 0x1b 0x64" ${FILE}

# Move cursor to the front of line
# ⌘ + ←
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0xf702-0x300000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf702-0x300000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf702-0x300000:Text string 0x01" ${FILE}

# Move cursor to the end of line
# ⌘ + →
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0xf703-0x300000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf703-0x300000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf703-0x300000:Text string 0x05" ${FILE}

# Move cursor one word left
# ⌥ + ←
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0xf702-0x280000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf702-0x280000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf702-0x280000:Text string 0x1b 0x62" ${FILE}

# Move cursor one word right
# ⌥ + →
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0xf703-0x280000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf703-0x280000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0xf703-0x280000:Text string 0x1b 0x66" ${FILE}

# Undo
# ⌘ + z
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0x7a-0x100000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x7a-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x7a-0x100000:Text string 0x1f" ${FILE}

# Redo
# ⇧ + ⌘ + z
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0x5a-0x120000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x5a-0x120000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x5a-0x120000:Text string 0x18 0x1f" ${FILE}

# Redo
# ⌘ + y
${CMD} "Delete :'New Bookmarks':0:'Keyboard Map':0x79-0x100000" ${FILE} 2>/dev/null
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x79-0x100000:Action integer 11" ${FILE}
${CMD} "Add :'New Bookmarks':0:'Keyboard Map':0x79-0x100000:Text string 0x18 0x1f" ${FILE}

# Show Status Bar
# Enable this in future revisions.
# ${CMD} "Delete :'New Bookmarks':0:'Show Status Bar'" ${FILE}
# ${CMD} "Add :'New Bookmarks':0:'Show Status Bar' bool true" ${FILE}

# GlobalTouchBarMap
${CMD} "Delete :GlobalTouchBarMap" ${FILE} 2>/dev/null
${CMD} "Add :GlobalTouchBarMap:'touchbar\:shared':Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:shared':Label string Shared" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:shared':Text string kubectl config use-context blue-shared\\\n" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:development':Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:development':Label string Development" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:development':Text string kubectl config use-context blue-development\\\n" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:production':Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:production':Label string Production" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:production':Text string kubectl config use-context blue-production\\\n" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:playpen':Action integer 12" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:playpen':Label string Playpen" ${FILE}
${CMD} "Add :GlobalTouchBarMap:'touchbar\:playpen':Text string kubectl config use-context blue-playpen\\\n" ${FILE}

# NSTouchBarConfig: regular
${CMD} "Delete :'NSTouchBarConfig\: regular':CurrentItems" ${FILE} 2>/dev/null
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems array" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:0 string touchbar:shared" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:1 string touchbar:development" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:2 string touchbar:production" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:3 string touchbar:playpen" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:4 string NSTouchBarItemIdentifierFlexibleSpace" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:5 string iTermTouchBarIdentifierStatus" ${FILE}
${CMD} "Add :'NSTouchBarConfig\: regular':CurrentItems:6 string NSTouchBarItemIdentifierOtherItemsProxy" ${FILE}
