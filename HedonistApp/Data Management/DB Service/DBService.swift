//
//  DBService.swift
//  HedonistApp
//
//  Created by Private on 11/21/24.
//

import SwiftUI
import SwiftData

protocol DBServiceProtocol: AnyObject {
    func fetch() -> [Landmark]
    func save(_ landmark: Landmark)
    func delete(_ landmark: Landmark)
}

final class DBService: DBServiceProtocol {
    @Environment(\.modelContext) var context
    @Query var landmarks: [Landmark]
    
    func fetch() -> [Landmark] {
        return landmarks
    }
    
    func save(_ landmark: Landmark) {
        context.insert(landmark)
    }
    
    func delete(_ landmark: Landmark) {
        context.delete(landmark)
    }
}
