## Miscellaneous Configurations

### Hiding Windows 8 window borders as much as possible
[Source](http://www.askvg.com/registry-tweak-to-decrease-window-border-size-and-padding-in-windows-8/)
regedit.exe
    -> HKEY_CURRENT_USER
    -> Control Panel
    -> Desktop
    -> WindowMetrics
    set BorderWidth = PaddedBorderWidth = 0

### Opening Mintty In Full Screen
Shortcut Target needs to be *T:\Packages\Cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -w full -*.
The ending '-' is important otherwise cygwin doesn't load properly.

### Sublime Text 3
See extra files