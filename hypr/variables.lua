local scheme = require("scheme.current")

return {
    ------------------
    ---- HYPRLAND ----
    ------------------

    -- Apps
    terminal                   = "kitty",
    browser                    = "zen-browser",
    editor                     = "codium",
    fileExplorer               = "thunar",
    audioSettings              = "pwvucontrol",

    -- Touchpad
    touchpadDisableTyping      = true,
    touchpadScrollFactor       = 0.3,
    gestureFingers             = 3,
    workspaceSwipeFingers      = 4,
    gestureFingersMore         = 4,

    -- Blur
    blurEnabled                = true,
    blurSpecialWs              = false,
    blurPopups                 = true,
    blurInputMethods           = true,
    blurSize                   = 8,
    blurPasses                 = 2,
    blurXray                   = false,

    -- Shadow
    shadowEnabled              = true,
    shadowRange                = 15,
    shadowRenderPower          = 4,
    shadowColour               = "rgba(" .. scheme.inversePrimary .. "10)",

    -- Gaps
    workspaceGaps              = 5,
    windowGapsIn               = 2.5,
    windowGapsOut              = 2.5,
    singleWindowGapsOut        = 5,

    -- Window styling
    windowOpacity              = 0.95,
    windowRounding             = 15,
    windowRoundingPower        = 2,
    windowBorderSize           = 1,
    activeWindowBorderColour   = "rgba(" .. scheme.primary .. "e6)",
    inactiveWindowBorderColour = "rgba(" .. scheme.onSurfaceVariant .. "11)",

    -- Misc
    volumeStep                 = 10,
    volumeMax                  = 100,
    cursorTheme                = "sweet-cursors",
    cursorSize                 = 24,
    sleepGestureCmd            = "systemctl suspend-then-hibernate",
    specialWsCloseAny          = true,

    ------------------
    ---- KEYBINDS ----
    ------------------

    -- Modifier only, the actual binds will be mod + 0-9. These should be strings and not arrays.
    kbGoToWs                   = "SUPER",
    kbGoToWsGroup              = "CTRL + SUPER",
    kbMoveWinToWs              = "SUPER + ALT",
    kbMoveWinToWsSilent        = "SUPER + SHIFT",
    kbMoveWinToWsGroup         = "CTRL + SUPER + ALT",

    -- All the following binds can be either an array of binds to bind multiple keys, or a single string.

    -- Workspaces
    kbMoveWinToWsSpecial       = { "SUPER + ALT + S", "CTRL + SUPER + SHIFT + K" },
    kbMoveWinFromWsSpecial     = "CTRL + SUPER + SHIFT + J",
    kbMoveWinToWsNext          = { "SUPER + ALT + mouse_down", "SUPER + ALT + Page_Down", "CTRL + SUPER + SHIFT + Right", "SUPER + SHIFT + O" },
    kbMoveWinToWsPrev          = { "SUPER + ALT + mouse_up", "SUPER + ALT + Page_Up", "CTRL + SUPER + SHIFT + Left", "SUPER + SHIFT + I" },
    kbNextWs                   = { "SUPER + mouse_down", "SUPER + O", "SUPER + Page_Down" },
    kbPrevWs                   = { "SUPER + mouse_up", "SUPER + I", "SUPER + Page_Up" },
    kbNextWsGroup              = "CTRL + SUPER + mouse_down",
    kbPrevWsGroup              = "CTRL + SUPER + mouse_up",

    -- Window Group
    kbWindowCycleNext          = "ALT + TAB",
    kbWindowCyclePrev          = "SHIFT + ALT + TAB",
    kbWindowGroupCycleNext     = "CTRL + ALT + TAB",
    kbWindowGroupCyclePrev     = "CTRL + SHIFT + ALT + TAB",
    kbUngroup                  = "SUPER + U",
    kbToggleGroup              = "SUPER + Comma",
    kbGroupLockActive          = "SUPER + SHIFT + Comma",

    -- Window Actions
    kbWindowDecreaseWidth      = { "SUPER + Minus", "SUPER + ALT + Left" },
    kbWindowIncreaseWidth      = { "SUPER + Equal", "SUPER + ALT + Right" },
    kbWindowDecreaseHeight     = { "SUPER + SHIFT + Minus", "SUPER + ALT + Up" },
    kbWindowIncreaseHeight     = { "SUPER + SHIFT + Equal", "SUPER + ALT + Down" },

    kbMoveWindow               = "SUPER + Z",
    kbSwapWithMaster           = "SUPER + space",
    kbResizeWindow             = "SUPER + X",
    kbCenterWindow             = "CTRL + SUPER + Backslash",
    kbNormalizeWindow          = "CTRL + SUPER + ALT + Backslash",
    kbWindowPip                = "SUPER + ALT + Backslash",
    kbPinWindow                = "SUPER + P",
    kbWindowFullscreen         = "SUPER + F",
    kbWindowBorderedFullscreen = "SUPER + ALT + F",
    kbToggleWindowFloating     = "SUPER + ALT + Space",
    kbCloseWindow              = "SUPER + Q",

    -- Special workspaces toggles
    kbSpecialWs                = "SUPER + S",
    kbSystemMonitorWs          = "CTRL + SHIFT + Escape",
    kbMusicWs                  = "SUPER + M",
    kbCommunicationWs          = "SUPER + D",
    kbTodoWs                   = "SUPER + R",

    -- Apps
    kbTerminal                 = "SUPER + T",
    kbBrowser                  = "SUPER + W",
    kbEditor                   = "SUPER + C",
    kbFileExplorer             = "SUPER + E",
    kbAudioSettings            = "CTRL + ALT + V",

    -- Utilities
    kbScreenshot               = "Print",
    kbScreenshotFreeze         = "SUPER + SHIFT + S",
    kbScreenshotRegion         = "SUPER + SHIFT + ALT + S",
    kbRecord                   = "CTRL + ALT + R",
    kbRecordSound              = "SUPER + ALT + R",
    kbRecordRegion             = "SUPER + SHIFT + ALT + R",
    kbColorPicker              = "SUPER + SHIFT + C",

    -- Media
    kbMediaToggle              = { "CTRL + SUPER + Space", "SUPER + semicolon" },
    kbMediaNext                = { "CTRL + SUPER + Equal", "SUPER + bracketleft" },
    kbMediaPrev                = { "CTRL + SUPER + Minus", "SUPER + bracketright" },
    kbMediaStop                = "CTRL + SUPER + Backspace",
    kbVolumeMute               = "SUPER + SHIFT + M",

    -- Misc
    kbLauncher                 = "SUPER + SUPER_L",
    kbSession                  = "SUPER + P",
    kbShowSidebar              = "SUPER + N",
    kbClearNotifs              = "CTRL + ALT + C",
    kbShowPanels               = "SUPER + A",
    kbLock                     = "SUPER + SHIFT + P",
    kbRestoreLock              = "SUPER + ALT + L",
    kbSleep                    = "SUPER + SHIFT + ALT + L",

    -- Clipboard and emoji picker
    kbClipboard                = "SUPER + V",
    kbClipboardDel             = "SUPER + ALT + V",
    kbClipboardPasteLatest     = "CTRL + SHIFT + ALT + V",
    kbEmoji                    = "SUPER + Period",
}
