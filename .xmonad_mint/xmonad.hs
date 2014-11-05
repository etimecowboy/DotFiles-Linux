-- xmonad config used by Xin Yang
-- Based on
-- http://github.com/vicfryzel/xmonad-config
-- http://www.haskell.org/haskellwiki/Xmonad/Config_archive/sykopomp%27s_xmonad.hs

import System.IO
import System.Exit
import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName

import XMonad.Layout.Fullscreen
import XMonad.Layout.Tabbed
import XMonad.Layout.WindowNavigation
import XMonad.Layout.TwoPane
import XMonad.Layout.OneBig
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Minimize
import XMonad.Layout.CenteredMaster
import XMonad.Layout.Grid
import XMonad.Layout.AutoMaster
-- import XMonad.Layout.LimitWindows
-- import XMonad.Layout.Spiral
-- import XMonad.Layout.Circle
-- import XMonad.Layout.Combo
-- import XMonad.Layout.ResizeableTile
-- import XMonad.Layout.PerWorkspace

import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.DwmPromote
-- import XMonad.Actions.CycleWS
-- import XMonad.Actions.Submap

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M


------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "urxvt"
-- myTerminal = "urxvtc"
-- myTerminal = "~/.xmonad/bin/myurxvt"


------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
myWorkspaces = ["1:work","2:ref","3:temp","4:media","5:vm","6:sys"] ++ map show [7..9]


------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "Firefox"        --> doShift "2:ref"
    , resource  =? "desktop_window" --> doIgnore
    , className =? "Conkeror"       --> doShift "1:work"
    -- , className =? "Galculator"     --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "gpicview"       --> doFloat
    -- , resource  =? "kdesktop"       --> doIgnore
    , resource  =? "skype"          --> doFloat
    -- , className =? "Emacs"          --> doShift "1:emacs"
    , className =? "VirtualBox"     --> doShift "5:vm"
    , className =? "Virtualbox"     --> doFloat
    , className =? "Xchat"          --> doShift "6:sys"
    , className =? "Banshee"        --> doShift "4:media"
    -- , className =? "Thunderbird"    --> doShift "3:temp"
    , className =? "totem"          --> doFloat
    , className =? "MPlayer"        --> doFloat
    , className =? "SMPlayer"       --> doFloat
    , className =? "Vlc"            --> doFloat
    , className =? "Synaptic"       --> doShift "6:sys"
    , className =? "Mate-system-monitor"  --> doShift "6:sys"
    , className =? "Gnome-commmander"     --> doShift "3:temp"
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]


------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout =
    (spacing 4 $ autoMaster 1 (1/100) Grid)     |||
    (spacing 4 $ OneBig (3/4) (3/4))            |||
    (spacing 4 $ centerMaster Grid)             |||
    TwoPane (3/100) (1/2)                       |||
    tabbed shrinkText myTabConfig               |||
    noBorders (fullscreenFull Full)
    -- (spacing 4 $ Tall 1 (3/100) (1/2))          |||
    -- (spacing 4 $ Mirror (Tall 1 (3/100) (1/2))) |||
    -- Circle                                      |||
    -- spiral (6/7))

------------------------------------------------------------------------
-- Colors and borders
-- Currently based on the ir_black theme.
--
myNormalBorderColor  = "#7c7c7c" -- "#7c7c7c"
myFocusedBorderColor = "#ff0000" -- "#ffb6b0"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
myTabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000",
    -- urgentColor = "#C500C5",
    decoHeight  = 22,
    fontName = "-*-yahei mono-*-r-normal-*-14-*-*-*-*-*-*-*"
}

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 2


------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

  -- Lock the screen using xscreensaver.
  , ((modMask .|. controlMask, xK_l), spawn "xscreensaver-command -lock")

  -- Launch dmenu.
  , ((modMask, xK_p), spawn "~/.xmonad/bin/mydmenu")

  -- -- Launch yeganesh, which is a wrap of dmenu (not very configurable)
  -- , ((modMask, xK_p),
  --    spawn "~/.xmonad/bin/myeganesh")

  -- launch gmrun
  -- BUG: not working
  , ((modMask .|. shiftMask, xK_p), spawn "gmrun")

  -- Take a screenshot in select mode.
  -- After pressing this key binding, click a window, or draw a rectangle with
  -- the mouse.
  , ((modMask .|. shiftMask, xK_p),
     spawn "~/.xmonad/bin/select-screenshot")

  -- Take full screenshot in multi-head mode.
  -- That is, take a screenshot of everything you see.
  , ((modMask .|. controlMask .|. shiftMask, xK_p),
     spawn "~/.xmonad/bin/screenshot")

  -- -- Mute volume.
  -- , ((0, 0x1008FF12),
  --    spawn "amixer -q set Front toggle")

  -- -- Decrease volume.
  -- , ((0, 0x1008FF11),
  --    spawn "amixer -q set Front 10%-")

  -- -- Increase volume.
  -- , ((0, 0x1008FF13),
  --    spawn "amixer -q set Front 10%+")

  -- -- Audio previous.
  -- , ((0, 0x1008FF16),
  --    spawn "")

  -- -- Play/pause.
  -- , ((0, 0x1008FF14),
  --    spawn "")

  -- -- Audio next.
  -- , ((0, 0x1008FF17),
  --    spawn "")

  -- -- Eject CD tray.
  -- , ((0, 0x1008FF2C),
  --    spawn "eject -T")

  -- system volumn control
  , ((modMask .|. shiftMask, xK_m), spawn "aumix -v +5")
  , ((modMask, xK_v), spawn "aumix -v -5")
  , ((modMask .|. controlMask, xK_v), spawn "aumix")

  -- window navigation
  -- next/previous emacs-like
  -- , ((modMask, xK_n), windows W.focusDown)
  -- change focus with arrows
  -- , ((modMask, xK_p), windows W.focusUp)
  -- , ("M-m", windows W.focusMaster)
  -- BUG: not working, xK_keycodes may be wrong
  -- , ((modMask, xK_Right), sendMessage $ Go R)
  -- , ((modMask, xK_Left),  sendMessage $ Go L)
  -- , ((modMask, xK_Up),    sendMessage $ Go U)
  -- , ((modMask, xK_Down),  sendMessage $ Go D)
  , ((modMask .|. controlMask, xK_j), sendMessage $ Go R)
  , ((modMask .|. controlMask, xK_l), sendMessage $ Go L)
  , ((modMask .|. controlMask, xK_i), sendMessage $ Go U)
  , ((modMask .|. controlMask, xK_k), sendMessage $ Go D)

  -- Window Movement
  -- swap
  -- BUG: not working, xK_keycodes may be wrong
  -- , ((modMask .|. shiftMask, xK_Right), sendMessage $ Swap R)
  -- , ((modMask .|. shiftMask, xK_Left),  sendMessage $ Swap L)
  -- , ((modMask .|. shiftMask, xK_Up),    sendMessage $ Swap U)
  -- , ((modMask .|. shiftMask, xK_Down),  sendMessage $ Swap D)
  , ((modMask .|. mod1Mask, xK_j), sendMessage $ Swap R)
  , ((modMask .|. mod1Mask, xK_l), sendMessage $ Swap L)
  , ((modMask .|. mod1Mask, xK_i), sendMessage $ Swap U)
  , ((modMask .|. mod1Mask, xK_k), sendMessage $ Swap D)
  -- emacs-like
  , ((modMask .|. shiftMask, xK_n), windows W.swapDown)
  , ((modMask .|. shiftMask, xK_p), windows W.swapUp)
  -- Swap with master/DwmPromote
  , ((modMask .|. shiftMask, xK_1), windows W.swapMaster)
  , ((modMask, xK_Return), dwmpromote) --might change this to M-<Return>

  -- Shrink/expand
  -- master area
  -- , ((modMask, xK_s), sendMessage Shrink)
  -- , ((modMask, xK_e), sendMessage Expand)
  -- subareas
  -- BUG: not working
  -- , ((modMask .|. shiftMask, xK_s), sendMessage MirrorShrink)
  -- , ((modMask .|. shiftMask, xK_e), sendMessage MirrorExpand)

  -- increase/decrease transparency
  -- Download and install transset-df from
  -- http://packages.debian.org/squeeze/transset-df
  -- BUG: not working
  -- , ((modMask .|. shiftMask, xK_comma),
  --    spawn "transset-df -a --dec .1")
  -- , ((modMask .|. shiftMask, xK_period),
  --    spawn "transset-df -a --inc .1")

  -- toggle tool gap
  , ((modMask, xK_b), sendMessage ToggleStruts)

  -- toggle minimized windows
  , ((modMask,               xK_a), withFocused minimizeWindow)
  , ((modMask .|. shiftMask, xK_a), sendMessage RestoreNextMinimizedWin)

  -- xmonad system
  , ((modMask .|. shiftMask, xK_z), spawn $ "xkill")
  , ((modMask .|. shiftMask, xK_r), refresh)
  , ((modMask, xK_x), spawn $ "xmonad --recompile")

  -- conkeror
  , ((modMask, xK_c), spawn $ "conkeror")

  -- firefox
  , ((modMask, xK_f), spawn $ "firefox")

  -- emacs
  , ((modMask, xK_e), spawn $ "/usr/local/bin/ecg")
  , ((modMask .|. shiftMask, xK_e), spawn $ "/usr/local/bin/emacs")

  -- gnome-system-monitor
  , ((modMask, xK_z), spawn $ "mate-system-monitor")

  -- gnome-commander
  , ((modMask, xK_d), spawn $ "gnome-commander")

  -- change window transparencies on the fly
  , ((modMask .|. shiftMask, xK_o), spawn "transset-df -p --inc 0.05")
  , ((modMask, xK_o), spawn "transset-df -p --dec 0.05 --min 0.2")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c), kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space), sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n), refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab), windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j), windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k), windows W.focusUp)

  -- Move focus to the master window.
  , ((modMask, xK_m), windows W.focusMaster)

  -- Swap the focused window and the master window.
  -- , ((modMask, xK_Return), windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j), windows W.swapDown)

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k), windows W.swapUp)

  -- Shrink the master area.
  , ((modMask, xK_h), sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l), sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t), withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma), sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period), sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q), io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q), restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]


------------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--


------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook = return ()
myStartupHook = setWMName "LG3D" -- for MATLAB GUI

------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
main = do
  spawn "~/.xmonad/bin/xmonadrc"
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = "   "}
      , manageHook = manageDocks <+> myManageHook
      , startupHook = myStartupHook
  }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = smartBorders $ avoidStruts (minimize (myLayout)),
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}
