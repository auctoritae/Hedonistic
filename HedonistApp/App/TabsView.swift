//
//  TabsView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI
import SwiftData

struct TabsView: View {
    @Environment(\.modelContext) var context
    
    var body: some View {
        TabView {
            Tab(content: {
                FeedView(
                    store: FeedStore(
                        state: FeedState(landmarks: [], filters: []),
                        reducer: FeedReducer(),
                        api: APIManager()),
                    context: context
                )
             }) {
                Image(systemName: "eye.fill")
                Text(SceneTitles.feed)
            }
            
            Tab(content: {
                BookmarksView(store: BookmarksStore(
                    state: BookmarksState(bookmarks: []),
                    reducer: BookmarksReducer(),
                    db: DBService(context: context)), context: context
                )
            }) {
                Image(systemName: "bookmark.fill")
                Text(SceneTitles.bookmarks)
            }
            
            Tab(content: {
                MapsView(store: MapsStore(
                    state: MapsState(landmarks: []),
                    reducer: MapsReducer(),
                    api: APIManager()
                ))
            }) {
                Image(systemName: "map.fill")
                Text(SceneTitles.map)
            }
        }
    }
}

#Preview {
    TabsView()
}
