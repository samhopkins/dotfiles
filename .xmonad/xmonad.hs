import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Hooks.SetWMName 
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run
 
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/samhop/.xmobarrc"
  xmonad $ defaultConfig 
    { manageHook = manageDocks <+> manageHook defaultConfig,
      layoutHook = avoidStruts $  layoutHook defaultConfig,
      logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "green" "" . shorten 50
                    },
      modMask = mod1Mask
    } `additionalKeys`
    [ ((controlMask .|. mod1Mask, xK_l), spawn "gnome-screensaver-command -l")
    ]
