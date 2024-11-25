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
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetch() -> [Landmark] {
        do {
            let fetchDescriptor = FetchDescriptor<Landmark>()
            return try context.fetch(fetchDescriptor)
        } catch {
            return []
        }
    }
    
    func save(_ landmark: Landmark) {
        context.insert(landmark)
        
        do {
            try context.save()
        } catch {
            debugPrint("DB save error: \(error.localizedDescription)")
        }
    }
    
    func delete(_ landmark: Landmark) {
        context.delete(landmark)
        
        do {
            try context.save()
        } catch {
            debugPrint("DB delete error: \(error.localizedDescription)")
        }
    }
}
