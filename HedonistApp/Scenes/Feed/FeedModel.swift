//
//  FeedModel.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

struct FilterCellModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    var selected: Bool
}
