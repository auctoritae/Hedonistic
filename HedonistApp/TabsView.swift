//
//  TabsView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            Tab(content: {
                FeedView(store: FeedStore(
                    state: FeedState(landmarks: [], filters: [], filtered: []),
                    reducer: FeedReducer(),
                    api: APIManager())
                )
             }) {
                Image(systemName: "eye.fill")
                Text(SceneTitles.feed)
            }
            
            Tab(content: {
                BookmarksView(store: BookmarksStore(
                    state: BookmarksState(),
                    reducer: BookmarksReducer())
                )
            }) {
                Image(systemName: "bookmark.fill")
                Text(SceneTitles.bookmarks)
            }
            
            Tab(content: { MapsView() }) {
                Image(systemName: "map.fill")
                Text(SceneTitles.map)
            }
            
            Tab(content: { SettingsView() }) {
                Image(systemName: "gear")
                Text(SceneTitles.settings)
            }
        }
    }
}

#Preview {
    TabsView()
}
