//
//  FeedAction.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

enum FeedAction {
    case start(_ landmarks: [Landmark])
    case filter(_ category: String)
    case clear
}
