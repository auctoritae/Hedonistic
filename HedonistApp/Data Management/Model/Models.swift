//
//  Models.swift
//  HedonistApp
//
//  Created by Private on 11/7/24.
//

import Foundation

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
