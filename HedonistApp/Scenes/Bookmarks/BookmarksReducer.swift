//
//  BookmarksReducer.swift
//  HedonistApp
//
//  Created by Private on 11/19/24.
//

import Foundation

final class BookmarksReducer {
    func reduce(state: inout BookmarksState, action: BookmarksAction) -> BookmarksState {
        var newState = state
       
        switch action {
        case .start:
            break
        case .delete:
            break
        }
        
        return newState
    }
}
