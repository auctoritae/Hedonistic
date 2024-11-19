//
//  BookmarksView.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import SwiftUI

struct BookmarksView: View {
    @Namespace var namespace
    var store: BookmarksStore
    
    var body: some View {
        NavigationStack {
            PrimaryTitle(text: SceneTitles.bookmarks)
        }
    }
}

#Preview {
    BookmarksView(store: BookmarksStore(
        state: BookmarksState(),
        reducer: BookmarksReducer()
    ))
}
