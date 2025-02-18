//
//  MapsView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI
import MapKit

struct MapsView: View {
    private enum Appearance {
        static let annotationSize: CGFloat = 25
        static let annotationPadding: CGFloat = 8
    }
    
    var store: MapsStore

    var body: some View {
        Map() {
            ForEach(store.state.landmarks, id: \.id) { landmark in
                Annotation(landmark.title,
                    coordinate: CLLocationCoordinate2D(
                    latitude: landmark.lat,
                    longitude: landmark.long),
                    anchor: .center
                ) {
                    Image(systemName: Icons.eye)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.yellow)
                        .frame(width: Appearance.annotationSize, height: Appearance.annotationSize)
                        .padding(Appearance.annotationPadding)
                        .background(.black, in: .circle)
                }
            }
        }
        .task {
            await store.fetchData()
            await store.checkPermissions()
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
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
