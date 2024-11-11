//
//  FeedView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI

struct FeedView: View {
    private enum Appearance {
        static let padding: CGFloat = 10
        static let radius: CGFloat = 20
    }
    
    @Namespace var namespace
    var store: FeedStore
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(store.state.landmarks, id: \.id) { model in
                    NavigationLink(value: model) {
                        FeedCellView(model: FeedCellModel(
                            title: model.name ?? "",
                            subtitle: model.category ?? "",
                            image: model.image ?? "")
                        )
                        .padding(.horizontal, Appearance.padding)
                        .matchedTransitionSource(
                            id: model.id,
                            in: namespace) { source in
                                source
                                    .background(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: Appearance.radius))
                            }
                    }
                }
                .onAppear {
                    store.fetchData()
                }
                .navigationDestination(for: Landmark.self) { model in
                    LandmarkView(model: model)
                        .navigationTransition(.zoom(sourceID: model.id, in: namespace))
                }
            }
        }
    }
}

#Preview {
    FeedView(store: FeedStore(
        state: FeedState(landmarks: [], filter: []),
        reducer: FeedReducer(),
        api: APIManager())
    )
}
