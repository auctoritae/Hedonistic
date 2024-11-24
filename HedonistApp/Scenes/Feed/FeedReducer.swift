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
        switch action {
        case let .start(landmarks):
            state.landmarks = landmarks.shuffled()
            state.filters = landmarks
                .map { FilterCellModel(title: $0.category ?? "", selected: false) }
                .uniqued(on: \.title)
            
        case let .filter(category):
            guard let index = state.filters.firstIndex(where: { $0.title == category }) else { return state }
            state.filters = state.filters.map { FilterCellModel(title: $0.title, selected: false) }
            state.filters[index].selected.toggle()
            state.type = .filtered(category)
            
        case let .save(landmark):
            guard let index = state.landmarks.firstIndex(where: { $0.id == landmark.id }) else { return state }
            state.landmarks[index].bookmarked = true
            
        case let .delete(landmark):
            guard let index = state.landmarks.firstIndex(where: { $0.id == landmark.id }) else { return state }
            state.landmarks[index].bookmarked = false
        }
        
        return state
    }
}
