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
        NavigationStack {
            PrimaryTitle(text: SceneTitles.map)
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
