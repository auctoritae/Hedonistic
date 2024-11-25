//
//  LandmarkStore.swift
//  HedonistApp
//
//  Created by Private on 11/25/24.
//

import Observation

@Observable
final class LandmarkStore {
    private(set) var state: LandmarkState
    private let reducer: LandmarkReducer
    private let db: DBServiceProtocol
    
    init(
        state: LandmarkState,
        reducer: LandmarkReducer,
        db: DBServiceProtocol
    ) {
        self.state = state
        self.reducer = reducer
        self.db = db
    }
    
    
    func send(action: LandmarkAction) {
        state = reducer.reduce(state: &state, action: action)
    }
    
    func fetchData() {
        let bookmarks = db.fetch()
        let landmark = state.landmark
        let isBookmarked = bookmarks.contains(where: { $0.name == landmark.name })
        send(action: .start(landmark: landmark, bookmarked: isBookmarked))
    }
    
    func dbAction() {
        guard let bookmarked = state.bookmarked else { return }
        let landmark = state.landmark
        bookmarked ? db.delete(landmark) : db.save(landmark)
        send(action: .database)
    }
}
