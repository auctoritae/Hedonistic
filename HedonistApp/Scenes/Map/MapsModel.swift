//
//  MapsModel.swift
//  HedonistApp
//
//  Created by Private on 12/7/24.
//

import Foundation

struct MapsModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let lat: Double
    let long: Double
}
