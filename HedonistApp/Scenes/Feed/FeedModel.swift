//
//  FeedModel.swift
//  HedonistApp
//
//  Created by Private on 11/8/24.
//

import Foundation

struct Landmark: Identifiable, Hashable {
    let id: UUID = UUID()
    let category: String?
    let name: String?
    let address: String?
    let lat: Double?
    let long: Double?
    let descript: String?
    let phone: String?
    let workhours: String?
    let image: String?
}

struct FeedCellModel {
    let title: String
    let subtitle: String
    let image: String
}

struct FilterCellModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let selected: Bool
}
