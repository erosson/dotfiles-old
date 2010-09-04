import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Gnome
import System.IO

-- http://xmonad.org/xmonad-docs/xmonad/src/XMonad-Config.html
-- http://xmonad.org/xmonad-docs/xmonad-contrib/src/XMonad-Config-Gnome.html
-- http://xmonad.org/xmonad-docs/xmonad-contrib/src/XMonad-Config-Desktop.html

-- http://hackage.haskell.org/packages/archive/X11/1.4.4/doc/html/Graphics-X11-Types.html#t%3AKeySym
-- http://haskell.org/haskellwiki/Xmonad/Config_archive/John_Goerzen's_Configuration
main = do
    --xmonad $ defaultConfig 
    xmonad $ gnomeConfig 
        -- don't show the red border for a single fullscreen app
        -- http://donsbot.wordpress.com/2010/03/13/after-3-years-my-xmonad-configuration-now-uses-gnome/
        { layoutHook = smartBorders (layoutHook gnomeConfig)
        , terminal = "gnome-terminal --hide-menubar"
        } `additionalKeys`
        --[ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        --[ ((controlMask .|. mod1Mask, xK_l), spawn "xscreensaver-command -lock")
        -- Rotate the screen
        [ ((controlMask .|. mod1Mask, xK_Left), spawn "xrandr -o left")
        , ((controlMask .|. mod1Mask, xK_Right), spawn "xrandr -o right")
        , ((controlMask .|. mod1Mask, xK_Down), spawn "xrandr -o normal")
        , ((controlMask .|. mod1Mask, xK_Up), spawn "xrandr -o inverted")
        -- alt-b
        --, ((controlMask .|. mod1Mask, xK_h), spawn "gconftool-2 --set --type boolean /apps/panel/toplevels/top_panel_screen0/auto_hide f")
        --, ((shiftMask .|. controlMask .|. mod1Mask, xK_h), spawn "gconftool-2 --set --type boolean /apps/panel/toplevels/top_panel_screen0/auto_hide t")
        --
        --, ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        --, ((0, xK_Print), spawn "scrot")
        ]
