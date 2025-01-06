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
}

enum DefaultLocation {
    static let latitude = 37.9668459
    static let longitude = 23.7306856
    static let zoom: Double = 1000
}

enum ErrorTitles {
    static let fetch = "Fetch error"
    static let database = "Data base error"
    static let phone = "Call error"
}

enum ErrorDescription {
    static let fetch = "Please try again"
    static let database = "Something went wrong - try to bookmark place again"
    static let phone = "No cell number found for this place"
}

enum Alerts {
    static let bookmarkAdded = "Added to bookmarks"
    static let locationServices = "Looks like that location is off or disallowed. You can change it in the your device settings."
}

enum EmptyState {
    static let bookmarksTitle = "You have no bookmarks yet"
    static let bookmarksDescription = "Take a look what we have in the Feed"
}
