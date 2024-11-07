//
//  Models.swift
//  HedonistApp
//
//  Created by Private on 11/7/24.
//

import Foundation

struct Landmark: Codable {
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
