//
//  FeedStore.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI

@Observable
final class FeedStore {
    private(set) var state: FeedState
    private let reducer: FeedReducer
    
    init(state: FeedState, reducer: FeedReducer) {
        self.state = state
        self.reducer = reducer
    }
    
    public func send(action: FeedAction) {
        state = reducer.reduce(state: &state, action: action)
    }
}
