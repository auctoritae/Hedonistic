//
//  FeedReducer.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation
import Algorithms

final class FeedReducer {
    private var landmarks: [Landmark] = []
    
    func reduce(state: inout FeedState, action: FeedAction) -> FeedState {
        var newState = state
        
        switch action {
        case let .start(landmarks):
            newState.landmarks = landmarks.shuffled()
            self.landmarks = newState.landmarks
            
            newState.filters = landmarks
                .map { FilterCellModel(title: $0.category ?? "", selected: false) }
                .uniqued(on: \.title)
            
        case let .filter(category):
            guard var filter = state.filters.first(where: { $0.title == category }) else { return state }
            guard let index = state.filters.firstIndex(where: { $0.title == category }) else { return state }
            
            filter.selected.toggle()
            state.filters.remove(at: index)
            newState.filters = state.filters.map { FilterCellModel(title: $0.title, selected: false) }
            newState.filters.insert(filter, at: index)
            
            let filtered = landmarks.filter({ $0.category == category })
            newState.landmarks = filter.selected ? filtered : landmarks
            
            return newState
        }
        
        return newState
    }
}
