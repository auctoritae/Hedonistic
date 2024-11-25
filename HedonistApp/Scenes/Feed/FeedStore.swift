//
//  FeedStore.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Observation

@Observable
final class FeedStore {
    private(set) var state: FeedState
    private let reducer: FeedReducer
    private let api: APIManagerProtocol
    
    init(
        state: FeedState,
        reducer: FeedReducer,
        api: APIManagerProtocol
    ) {
        self.state = state
        self.reducer = reducer
        self.api = api
    }
    
    
    func send(action: FeedAction) {
        state = reducer.reduce(state: &state, action: action)
    }
    
    func fetchData() {
        guard state.landmarks.isEmpty else { return }
        
        Task { @MainActor in
            let result = try await api.fetchData()
            send(action: .start(result.map {
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
            }))
        }
    }
}
