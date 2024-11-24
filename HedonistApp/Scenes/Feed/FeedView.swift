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
        static let gridItemHeight: CGFloat = 35
        static let gridHeight: CGFloat = 70
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
    func dbAction(type: FeedDBAction) {
        switch type {
        case let .save(landmark):
            store.save(landmark)
        case let .delete(landmark):
            store.delete(landmark)
        }
    }
}


#Preview {
    FeedView(store: FeedStore(
        state: FeedState(landmarks: [], filters: []),
        reducer: FeedReducer(),
        api: APIManager(),
        db: DBService())
    )
}
