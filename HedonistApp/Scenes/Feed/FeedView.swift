//
//  FeedView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI
import SwiftData

struct FeedView: View {
    private enum Appearance {
        static let padding: CGFloat = 10
        static let radius: CGFloat = 20
        static let spacing: CGFloat = 20
        static let gridItemHeight: CGFloat = 35
        static let gridHeight: CGFloat = 70
        static let cellHeight: CGFloat = 180
    }
    
    @Namespace var namespace
    var store: FeedStore
    let context: ModelContext
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.fixed(Appearance.gridItemHeight))],
                    alignment: .center,
                    spacing: Appearance.padding)
                {
                    ForEach(store.state.filters, id: \.id) { model in
                        FilterCellView(model: model).onTapGesture {
                            store.send(action: .filter(model.title))
                        }
                    }
                }
                .padding(.horizontal, Appearance.padding)
            }
            .frame(height: Appearance.gridHeight)
            .scrollIndicators(.hidden)
            
            ScrollView(.vertical) {
                ForEach(store.state.filtered, id: \.id) { model in
                    NavigationLink(value: model) {
                        LandmarkCellView(height: Appearance.cellHeight, model: LandmarkCellModel(
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
            .task {
                await store.fetchData()
            }
            .navigationTitle(Text(SceneTitles.feed.uppercased()))
        }
    }
}
