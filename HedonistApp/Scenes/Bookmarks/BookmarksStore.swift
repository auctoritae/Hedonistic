//
//  BookmarksStore.swift
//  HedonistApp
//
//  Created by Private on 11/19/24.
//

import Observation

@MainActor
@Observable
final class BookmarksStore {
    private(set) var state: BookmarksState
    private let reducer: BookmarksReducer
    private let db: DBServiceProtocol
    
    init(
        state: BookmarksState,
        reducer: BookmarksReducer,
        db: DBServiceProtocol
    ) {
        self.state = state
        self.reducer = reducer
        self.db = db
    }
    
    
    private func send(action: BookmarksAction) {
        state = reducer.reduce(state: &state, action: action)
    }
    
    func fetchData() {
        let bookmarks = db.fetch()
        send(action: .start(bookmarks))
    }
    
    func delete(_ landmark: Landmark) {
        db.delete(landmark)
        send(action: .delete(landmark))
    }
}
