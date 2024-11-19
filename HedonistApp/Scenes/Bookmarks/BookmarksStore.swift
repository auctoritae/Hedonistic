//
//  BookmarksStore.swift
//  HedonistApp
//
//  Created by Private on 11/19/24.
//

import Observation

@Observable
final class BookmarksStore {
    private(set) var state: BookmarksState
    private let reducer: BookmarksReducer
    
    init(
        state: BookmarksState,
        reducer: BookmarksReducer
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    
    func send(action: BookmarksAction) {
        state = reducer.reduce(state: &state, action: action)
    }
}
