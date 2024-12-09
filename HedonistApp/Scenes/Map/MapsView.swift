//
//  MapsView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    var store: MapsStore
    
    var body: some View {
        Map {
            ForEach(store.state.landmarks, id: \.id) { landmark in
                Marker(landmark.title, coordinate: CLLocationCoordinate2D(
                    latitude: landmark.lat,
                    longitude: landmark.long)
                )
            }
        }
        .onAppear {
            store.fetchData()
        }
    }
}

#Preview {
    MapsView(store: MapsStore(
        state: MapsState(landmarks: []),
        reducer: MapsReducer(),
        api: APIManager()
    ))
}
