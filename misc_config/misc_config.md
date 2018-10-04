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
Shortcut Target needs to be *{cygwin location}\bin\mintty.exe -i /Cygwin-Terminal.ico -w full -*.
The ending '-' is important otherwise cygwin doesn't load properly.

### Sublime Text 3
See extra files 

### Fonts
Inconsolata.ttf seems to have less problems than inconsolata.otf.

### Python
https://www.scipy.org/scipylib/building/windows.html

## VTK Cygwin patch
http://hvrl.ics.keio.ac.jp/kimura/vtk/vtk-6.3.0.html

cmake -D CMAKE_BUILD_TYPE:STRING=RELEASE \
        -D BUILD_SHARED_LIBS:BOOL=OFF \
        -D VTK_USE_X:BOOL=OFF \
        -D OPENGL_INCLUDE_DIR:STRING=/usr/include/w32api/ \
        -D OPENGL_gl_LIBRARY:STRING=/usr/lib/w32api/libopengl32.a \
        -D OPENGL_glu_LIBRARY:STRING=/usr/lib/w32api/libglu32.a \
        -D VTK_USE_SYSTEM_HDF5:BOOL=ON \
        -D VTK_USE_SYSTEM_JPEG:BOOL=ON \
        -D VTK_USE_SYSTEM_PNG:BOOL=ON \
        -D VTK_USE_SYSTEM_TIFF:BOOL=ON \
        -D VTK_USE_SYSTEM_ZLIB:BOOL=ON \
        -D VTK_WRAP_PYTHON:BOOL=ON \
        -D VTK_PYTHON_VERSION:STRING=3.4 \
        -D CMAKE_INSTALL_PREFIX:STRING=/usr/local/vtk-7.0.0/ \
        /tmp/VTK-7.0.0/