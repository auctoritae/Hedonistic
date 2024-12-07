//
//  MapsReducer.swift
//  HedonistApp
//
//  Created by Private on 12/7/24.
//

import Foundation

final class MapsReducer {
    func reduce(state: inout MapsState, action: MapsActions) -> MapsState {
        switch action {
        case let .start(landmarks):
            state.landmarks = landmarks
        }
        
        return state
    }
}
