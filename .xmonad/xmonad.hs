import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.ToggleLayouts
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.NoBorders

myLayouts = smartSpacing 4 $ smartBorders ( Tall 1 (3/100) (1/2) ) ||| smartBorders ( Mirror (Tall 1 (3/100) (3/5)) ) ||| noBorders Full


myKeys :: [(String, X ())]
myKeys =
    [

    --------------------- Hardware ---------------------

    -- Volume
    ("<XF86AudioLowerVolume>", spawn "amixer -D pulse set Master 10%-"),
    ("<XF86AudioRaiseVolume>", spawn "amixer -D pulse set Master 10%+"),
    ("<XF86AudioMute>", spawn "amixer -D pulse set Master 1+ toggle" ),

    -- Brightness
    ("<XF86MonBrightnessUp>", spawn "brightnessctl set +10%"),
    ("<XF86MonBrightnessDown>", spawn "brightnessctl set 10%-"),
    
    --------------- Open Project Vscode ----------------
   
    ("M-v", spawn "~/.scripts/openProjectCode.sh")

    ]

main = xmonad $ def
    {
    terminal = "alacritty",
    modMask = mod4Mask,
    borderWidth        = 1,
    normalBorderColor  = "#292d3e",
    focusedBorderColor = "#c792ea",
    layoutHook = myLayouts
    }`additionalKeysP` myKeys
