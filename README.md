# FocusedWindow

FocusedWindow queries the OS to generate metadata about the currently active window.

Metadata is stored in a WindowMetadata type with getter functions for Name, Id, Bundle Identifier, etc.

To generate a WindowMetadata of the currently focused window:

activeWindow = FocusedWindow( ).getMetadata() [Returns WindowMetadata type]
activeWindow.getName( )
activeWindow.getFrame( )
