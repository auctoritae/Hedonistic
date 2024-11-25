//
//  LandmarkReducer.swift
//  HedonistApp
//
//  Created by Private on 11/25/24.
//

import Foundation

final class LandmarkReducer {
    func reduce(state: inout LandmarkState, action: LandmarkAction) -> LandmarkState {
        switch action {
        case let .start(landmark, bookmarked):
            state.landmark = landmark
            state.bookmarked = bookmarked
        case .database:
            state.bookmarked?.toggle()
        }
        
        return state
    }
}
