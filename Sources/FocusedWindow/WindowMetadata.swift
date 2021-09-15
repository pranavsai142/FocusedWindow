//
//  File.swift
//  
//
//  Created by Pranav Sai on 9/14/21.
//

import Foundation

public struct WindowMetadata: Equatable {
    private let windowId : Int32
    private let windowBundleIdentifier : String
    private let windowData : NSDictionary
    
    public init(windowId: Int32, windowBundleIdentifier: String, windowData: NSDictionary) {
        self.windowId = windowId
        self.windowBundleIdentifier = windowBundleIdentifier
        self.windowData = windowData
    }
    
    public init() {
        self.windowId = 0
        self.windowBundleIdentifier = ""
        self.windowData = NSDictionary()
    }
    
    public func getId() -> Int32 {
        return windowId
    }
    
    public func getBundleIdentifier() -> String {
        return windowBundleIdentifier
    }
    
    public func getData() -> NSDictionary {
        return windowData
    }
    
    public func getName() -> String {
        return windowData.value(forKey: "kCGWindowOwnerName") as! String
    }
    
    public func getFrame() -> NSRect {
        let windowBoundsData = windowData.value(forKey: "kCGWindowBounds") as! NSDictionary
        let windowX = windowBoundsData["X"]
        let windowY = windowBoundsData["Y"]
        let windowWidth = windowBoundsData["Width"]
        let windowHeight = windowBoundsData["Height"]
        var windowBounds = NSRect()
        windowBounds.origin.x = windowX as! CGFloat;
        windowBounds.origin.y = windowY as! CGFloat;
        windowBounds.size.width = windowWidth as! CGFloat;
        windowBounds.size.height = windowHeight as! CGFloat;
        return windowBounds
    }
    
    public func getLevel() -> Int {
        return windowData.value(forKey: "kCGWindowLayer") as! Int
    }
    
    public static func == (lhs: WindowMetadata, rhs: WindowMetadata) -> Bool {
        return lhs.getId() == rhs.getId()
    }
}
