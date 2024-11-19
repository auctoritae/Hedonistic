//
//  FeedModel.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

struct FeedCellModel {
    let title: String
    let subtitle: String
    let image: String
}

struct FilterCellModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    var selected: Bool
}
