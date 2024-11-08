//
//  FeedReducer.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

final class FeedReducer {
    
    private var api: APIManager
    
    init(api: APIManager) {
        self.api = api
    }
    
    func reduce(state: inout FeedState, action: FeedAction) -> FeedState {
        var state = state
        
        switch action {
        case .start:
            state.landmarks = []
            
            Task { @MainActor in
                let result = try await api.fetchData()
                state.landmarks = result.map {
                    Landmark(
                        category: $0.category,
                        name: $0.name,
                        address: $0.address,
                        lat: $0.lat,
                        long: $0.long,
                        descript: $0.descript,
                        phone: $0.phone,
                        workhours: $0.workhours,
                        image: $0.image
                    )
                }
            }
            
        case let .filter(category):
            state.filter = []
            state.filter = state.landmarks.filter { $0.category == category }
            
        case .clear:
            state.filter = []
        }
        
        return state
    }
}
