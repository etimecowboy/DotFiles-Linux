!!! Xft settings
Xft*dpi:              96
Xft*antialias:        true
Xft*hinting:          full
Xft*hintstyle:        hintslight
Xft*rgba:             rgb
! Xft*rgba:             subpixel
Xft*lcdfilter:        lcddefault
! Xft:DejavuSansMono for Powerline Nerd Font:size=11,xft:Microsoft YaHei

!!! xterm / uxterm
! ref: https://github.com/zma/config_files/blob/master/Xresources.for.xterm
UXTerm*loginShell:        true
UXTerm*geometry:          80x30
UXTerm*savelines:         16384
UXTerm*scrollTtyOutput:   false
UXTerm*background:        #261c14
UXTerm*foreground:        #a3adb8
UXTerm*cursorColor:       #a3adb8
UXTerm*visualBell:        true
UXTerm*bellIsUrgent:      true
UXTerm*borderWidth:       0
UXTerm*cursorBlink:       true
UXTerm*allowTitleOps:     true
! UXTerm*rightScrollBar:    false
UXTerm*ScrollBar:         false
UXTerm*locale:            true
UXTerm*termName:          xterm-256color
UXTerm*metaSendsEscape:   false
UXTerm*modifyOtherKeys:   true
UXTerm*selectToClipboard: true
! Make alt work
UXTerm*eightBitInput:     false
UXTerm*eightBitOutput:    true
! sixel graphic support (required by sixel)
UXTerm*decTerminalID:     vt340
! utf8 supports
UXTerm*utf8*:             true
! UXTerm*utf8:              true
! UXTerm*utf8Fonts:         true
! UXTerm*utf8Title:         true
! Default font and size
! UXTerm*faceName:          Iosevka Nerd Font Mono
! UXTerm*faceName:          Source Code Pro
! UXTerm*faceName:          SauceCodePro Nerd Font Mono
! UXTerm*faceName:          VictorMono Nerd Font Mono
! UXTerm*faceName:          mononoki Nerd Font Mono
! UXTerm*faceName:          Lekton Nerd Font Mono
! UXTerm*faceName:          Monoid Nerd Font Mono
! UXTerm*faceName:          UbuntuMono Nerd Font Mono
! UXTerm*faceName:          DejaVuSansMono Nerd Font Mono
! XTerm*faceName:           xft:Cascadia Code,xft:Twitter Color Emoji,xft:JoyPixels,xft:Noto Color Emoji
! UXTerm*faceName:          xft:Cascadia Code,xft:Twitter Color Emoji,xft:JoyPixels,xft:Noto Color Emoji
XTerm*faceName:           xft:FiraCode Nerd Font Mono,xft:Symbols Nerd Font,xft:Twitter Color Emoji,xft:JoyPixels,xft:Noto Color Emoji
UXTerm*faceName:          xft:FiraCode Nerd Font Mono,xft:Symbols Nerd Font,xft:Twitter Color Emoji,xft:JoyPixels,xft:Noto Color Emoji
UXTerm*faceSize:          10
UXTerm*allowBoldFonts:    true
! UXTerm*faceNameDoublesize:方正行楷_GBK
! UXTerm*faceNameDoublesize:方正仿宋_GBK
! UXTerm*faceNameDoublesize:方正粗宋_GBK
! XTerm*faceNameDoublesize: 方正粗圆_GBK
! UXTerm*faceNameDoublesize: 方正粗圆_GBK
XTerm*faceNameDoublesize: xft:Adobe 黑体 Std
UXTerm*faceNameDoublesize: xft:Adobe 黑体 Std
! Key binds
! Double-click to select whole URLs :D
!UXTerm*charClass:       33:48,36-47:48,58-59:48,61:48,63-64:48,95:48,126:48
! Single-click to follow the link
UXTerm*charClass:         33:48,35:48,37:48,43:48,45-47:48,64:48,95:48,126:48
UXTerm*translations:      #override \n\
    Shift <Key>Insert:    insert-selection(SELECT) \n\
    Ctrl Shift <Key>V:    insert-selection(SELECT) \n\
    Ctrl Shift <Key>C:    copy-selection(SELECT) \n\
    Ctrl <Key>+:          larger-vt-font() \n\
    Ctrl <Key>-:          smaller-vt-font()

!!! zutty
! REF: https://github.com/tomszilagyi/zutty/blob/master/doc/USAGE.org#persistent-configuration
! Zutty.title:                   The Big Zutty
! Zutty.geometry:                120x45
Zutty.altScroll:          true
! Zutty.boldColors:              false
! Zutty.font:               FiraCode Nerd Font Mono
Zutty.fontsize:           12
! Zutty.fontpath:           /usr/local/share/fonts/truetype
! Zutty.fg:                      #00ff80
! Zutty.bg:                      #234
Zutty.cr:                 #050
