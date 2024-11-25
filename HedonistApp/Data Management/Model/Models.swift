//
//  Models.swift
//  HedonistApp
//
//  Created by Private on 11/7/24.
//

import Foundation
import SwiftData

struct APIRecord: Codable {
    let record: [APIModel]
}

struct APIModel: Codable {
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

@Model
final class Landmark: Hashable {
    var category: String?
    var name: String?
    var address: String?
    var lat: Double?
    var long: Double?
    var descript: String?
    var phone: String?
    var workhours: String?
    var image: String?
    var bookmarked: Bool
    
    init(category: String? = nil, name: String? = nil, address: String? = nil, lat: Double? = nil, long: Double? = nil, descript: String? = nil, phone: String? = nil, workhours: String? = nil, image: String? = nil, bookmarked: Bool) {
        self.category = category
        self.name = name
        self.address = address
        self.lat = lat
        self.long = long
        self.descript = descript
        self.phone = phone
        self.workhours = workhours
        self.image = image
        self.bookmarked = bookmarked
    }
}

struct LandmarkCellModel {
    let title: String
    let subtitle: String
    let image: String
}
