//
//  Constants.swift
//  HedonistApp
//
//  Created by Private on 11/7/24.
//

import Foundation

enum SceneTitles {
    static let feed = "Feed"
    static let bookmarks = "Bookmarks"
    static let map = "Map"
    static let settings = "Settings"
}

enum DefaultLocation {
    static let latitude = 37.9668459
    static let longitude = 23.7306856
    static let zoom: Double = 1000
}

enum Errors {
    static let fetch = "Fetch error.\nPlease try again"
    static let database = "Something went wrong - try to bookmark place again"
    static let phone = "No cell number found for this place"
    static let server = "Server error. Please try again later"
}

enum Alerts {
    static let bookmarkAdded = "Added to bookmarks"
    static let locationServices = "Looks like that location is off or disallowed. You can change it in the your device settings."
}

enum EmptyState {
    static let bookmarks = "You have no bookmarks yet.\nTake a look what we have in the Feed"
}
