//
//  BookmarksView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI
import SwiftData

struct BookmarksView: View {
    private enum Appearance {
        static let padding: CGFloat = 10
        static let radius: CGFloat = 20
    }
    
    @Namespace var namespace
    var store: BookmarksStore
    let context: ModelContext
    
    var body: some View {
        NavigationStack {
            PrimaryTitle(text: SceneTitles.bookmarks)
            
            ScrollView(.vertical) {
                ForEach(store.state.bookmarks, id: \.id) { model in
                    NavigationLink(value: model) {
                        LandmarkCellView(model: LandmarkCellModel(
                            title: model.name ?? "",
                            subtitle: model.category ?? "",
                            image: model.image ?? "")
                        )
                        .padding(.horizontal, Appearance.padding)
                        .matchedTransitionSource(id: model.id, in: namespace) { source in
                            source
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: Appearance.radius))
                        }
                    }
                    .navigationDestination(for: Landmark.self) { model in
                        LandmarkView(store: LandmarkStore(
                            state: LandmarkState(landmark: model),
                            reducer: LandmarkReducer(),
                            db: DBService(context: context))
                        )
                            .navigationTransition(.zoom(sourceID: model.id, in: namespace))
                    }
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                store.fetchData()
            }
        }
    }
}
