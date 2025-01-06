//
//  MapsStore.swift
//  HedonistApp
//
//  Created by Private on 12/7/24.
//

import Observation
import MapKit
import CoreLocation

@Observable
final class MapsStore: NSObject, CLLocationManagerDelegate {
    private(set) var state: MapsState
    private let reducer: MapsReducer
    private let api: APIManagerProtocol
    private var locationManager: CLLocationManager?
    
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
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
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
    
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            /// TODO alert
            break
        case .authorizedWhenInUse, .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
