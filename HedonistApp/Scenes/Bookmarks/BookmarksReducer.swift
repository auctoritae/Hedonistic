//
//  BookmarksReducer.swift
//  HedonistApp
//
//  Created by Private on 11/19/24.
//

import Foundation

final class BookmarksReducer {
    func reduce(state: inout BookmarksState, action: BookmarksAction) -> BookmarksState {
        switch action {
        case let .start(bookmarks):
            state.bookmarks = bookmarks
        case let .delete(bookmark):
            guard let index = state.bookmarks.firstIndex(where: { $0.id == bookmark.id }) else { return state }
            state.bookmarks.remove(at: index)
        }
        
        return state
    }
}
