//
//  FeedView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI

struct FeedView: View {
    @Namespace var namespace
    var store: FeedStore
    
    var body: some View {
        ScrollView {
            ForEach(store.state.landmarks, id: \.id) { model in
                NavigationLink(value: model) {
                    FeedCellView(model: FeedCellModel(
                        title: model.name ?? "",
                        subtitle: model.category ?? "",
                        image: model.image ?? "")
                    )
                    .matchedTransitionSource(id: model.id, in: namespace)
                }
            }
        }
        .padding(.all, 20)
        .scrollIndicators(.hidden)
        .onAppear {
            store.send(action: .start)
        }
//        .navigationDestination(for: Landmark.self) { model in
//            FeedItemView(model: model)
//                .navigationTransition(.zoom(sourceID: model.id, in: namespace))
//        }
    }
}

#Preview {
    FeedView(store: FeedStore(
        state: FeedState(landmarks: [], filter: []),
        reducer: FeedReducer(api: APIManager()))
    )
}
