//
//  FeedState.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

enum FeedStateType {
    case all
    case filtered(String)
}

struct FeedState {
    var landmarks: [Landmark] = []
    var filters: [FilterCellModel] = []
    var type: FeedStateType = .all
    
    var filtered: [Landmark] {
        switch type {
        case .all:
            return landmarks
        case let .filtered(category):
            return landmarks.filter { $0.category == category }
        }
    }
}
