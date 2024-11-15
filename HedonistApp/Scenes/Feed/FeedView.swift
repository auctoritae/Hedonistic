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
        static let spacing: CGFloat = 20
        static let gridItemHeight: CGFloat = 40
        static let gridHeight: CGFloat = 60
    }
    
    @Namespace var namespace
    var store: FeedStore
    
    var body: some View {
        NavigationStack {
            PrimaryTitle(text: SceneTitles.feed)
            
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.fixed(Appearance.gridItemHeight))],
                    alignment: .center,
                    spacing: Appearance.padding)
                {
                    ForEach(store.state.filters, id: \.id) { model in
                        FilterCellView(model: model)
                    }
                }
                .padding(.horizontal, Appearance.padding)
            }
            .frame(width: .infinity, height: Appearance.gridHeight)
            .scrollIndicators(.hidden)
            
            ScrollView(.vertical) {
                ForEach(store.state.landmarks, id: \.id) { model in
                    NavigationLink(value: model) {
                        FeedCellView(model: FeedCellModel(
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
                        LandmarkView(model: model, delegate: self)
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

extension FeedView: LandmarkViewDelegate {
    func close() {
        
    }
    
    func save() {
        
    }
    
    func call() {
        
    }
}

#Preview {
    FeedView(store: FeedStore(
        state: FeedState(landmarks: [], filters: [], filtered: []),
        reducer: FeedReducer(),
        api: APIManager())
    )
}
