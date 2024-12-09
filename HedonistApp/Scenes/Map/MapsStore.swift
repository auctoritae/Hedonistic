//
//  MapsStore.swift
//  HedonistApp
//
//  Created by Private on 12/7/24.
//

import Observation

@Observable
final class MapsStore {
    private(set) var state: MapsState
    private let reducer: MapsReducer
    private let api: APIManagerProtocol
    
    init(
        state: MapsState,
        reducer: MapsReducer,
        api: APIManagerProtocol
    ) {
        self.state = state
        self.reducer = reducer
        self.api = api
    }
    
    func send(action: MapsActions) {
        state = reducer.reduce(state: &state, action: action)
    }
    
    func fetchData() {
        guard state.landmarks.isEmpty else { return }
        
        Task { @MainActor in
            let result = try await api.fetchData()
            send(action: .start(result.compactMap {
                MapsModel(
                    title: $0.name ?? "",
                    lat: $0.lat ?? 0.0,
                    long: $0.long ?? 0.0
                )
            }))
        }
    }
}
