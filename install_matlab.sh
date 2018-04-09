#!/bin/bash
# Install MATLAB

srcDir=pwd
if [ ! -e ~/.local/share/applications/MATLAB.desktop ]; then
    ln -s "$srcDir"/.local/share/applications/MATLAB.desktop ~/.local/share/applications/MATLAB.desktop
fi

## Update desktop database
update-desktop-database ~/.local/share/applications/


# ## JabRef
# if [ ! -e ~/.local/share/applications/JabRef.desktop ]; then
#     ln -s $srcDir$/.local/share/applications/JabRef.desktop ~/.local/share/applications/JabRef.desktop
# fi

# ## Eclipse
# if [ ! -e ~/.local/share/applications/Eclipse.desktop ]; then
#     ln -s $srcDir$/.local/share/applications/Eclipse.desktop ~/.local/share/applications/Eclipse.desktop
# fi
