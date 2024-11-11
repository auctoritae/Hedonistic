//
//  FeedReducer.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

final class FeedReducer {
    func reduce(state: inout FeedState, action: FeedAction) -> FeedState {
        var newState = state
        
        switch action {
        case let .start(landmarks):
            newState.landmarks = landmarks.shuffled()
        case let .filter(category):
            newState.filter = []
            newState.filter = state.landmarks.filter { $0.category == category }
        case .clear:
            newState.filter = []
        }
        
        return newState
    }
}
