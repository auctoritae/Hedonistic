//
//  FeedReducer.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation
import Algorithms

final class FeedReducer {
    func reduce(state: inout FeedState, action: FeedAction) -> FeedState {
        var newState = state
        
        switch action {
        case let .start(landmarks):
            newState.landmarks = landmarks.shuffled()
            newState.filters = landmarks
                .map { FilterCellModel(title: $0.category ?? "", selected: false) }
                .uniqued(on: \.title)
            
        case let .filter(category):
            ///
            return newState
        }
        
        return newState
    }
}
