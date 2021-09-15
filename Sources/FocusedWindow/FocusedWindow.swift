import Foundation
import AppKit
import CoreGraphics

public struct FocusedWindow {
//    Metadata of current focus
    public var currentFocus : WindowMetadata
//    activeApplication instance. Optional type because there may be a nil active app
    public init() {
//        initialize metadata
        currentFocus = WindowMetadata()
//        Refresh to pull current window data
        refresh()
    }
    
//    Refreshes the current focus and requeries for active application
    public mutating func refresh() {
//        Checks for which app owns the menu bar. That is the active app
        let activeApp = NSWorkspace.shared.menuBarOwningApplication!
        let activeWindowBundleIdentifier = activeApp.bundleIdentifier!
        let activeWindowId = activeApp.processIdentifier
        
//        Get CGWindows type data to pull level and frame
        let options = CGWindowListOption(arrayLiteral: CGWindowListOption.excludeDesktopElements, CGWindowListOption.optionOnScreenOnly)
        let CGwindows = (CGWindowListCopyWindowInfo(options, CGWindowID(0))!) as NSArray
        var activeWindowData = NSDictionary()
//        find CGwindow maatching NSWorkspace window using PIDs
        for i in Range(uncheckedBounds: (0, CGwindows.count)) {
            let windowData = CGwindows[i] as! NSDictionary
            let windowId = windowData.value(forKey: "kCGWindowOwnerPID") as! Int32
            if (activeWindowId == windowId) {
                activeWindowData = windowData
                break;
            }
        }
//        Deposit all data in WindowMetadata type and set to initialization variable
        self.currentFocus = WindowMetadata(windowId: activeWindowId, windowBundleIdentifier: activeWindowBundleIdentifier, windowData: activeWindowData)
        
    }
    
//    Returns the current focus of the os
    public func getMetadata() -> WindowMetadata {
        return currentFocus
    }
}
