import Foundation
import AppKit
import CoreGraphics

public struct FocusedWindow {
//    Metadataa of
    public var currentFocus : WindowMetadata
//    activeApplication instance. Optional type because there may be a nil active app
    public init() {
        currentFocus = WindowMetadata()
        refresh()
    }
    
    public mutating func refresh() {
        let activeApp = NSWorkspace.shared.frontmostApplication!
        let activeWindowBundleIdentifier = activeApp.bundleIdentifier!
        print(activeWindowBundleIdentifier)
        let activeWindowId = activeApp.processIdentifier
        
        let options = CGWindowListOption(arrayLiteral: CGWindowListOption.excludeDesktopElements, CGWindowListOption.optionOnScreenOnly)
        let CGwindows = (CGWindowListCopyWindowInfo(options, CGWindowID(0))!) as NSArray
        var activeWindowData = NSDictionary()
        for i in Range(uncheckedBounds: (0, CGwindows.count)) {
            let windowData = CGwindows[i] as! NSDictionary
            let windowId = windowData.value(forKey: "kCGWindowOwnerPID") as! Int32
            if (activeWindowId == windowId) {
                activeWindowData = windowData
                break;
            }
        }

        self.currentFocus = WindowMetadata(windowId: activeWindowId, windowBundleIdentifier: activeWindowBundleIdentifier, windowData: activeWindowData)
        
    }
    
    public func getMetadata() -> WindowMetadata {
        return currentFocus
    }
}
