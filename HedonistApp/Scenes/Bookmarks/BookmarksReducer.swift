//
//  BookmarksReducer.swift
//  HedonistApp
//
//  Created by Private on 11/19/24.
//

import Foundation
import Algorithms

final class BookmarksReducer {
    private var bookmarks: [Landmark] = []
    
    func reduce(state: inout BookmarksState, action: BookmarksAction) -> BookmarksState {
        var newState = state
       
        switch action {
        case let .start(bookmarks):
            self.bookmarks = bookmarks
            newState.bookmarks = bookmarks
            
        case .delete:
            break
        }
        
        return newState
    }
}
