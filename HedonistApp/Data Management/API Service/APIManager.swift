//
//  APIManager.swift
//  HedonistApp
//
//  Created by Private on 11/7/24.
//

import Foundation

protocol APIManagerProtocol {
    func fetchData() async throws -> [APIModel]
}

final class APIManager: APIManagerProtocol {
    func fetchData() async throws -> [APIModel] {
        guard let url = URL(string: APICredentials.url) else { return [] }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(APICredentials.apiKey, forHTTPHeaderField: APICredentials.masterHeader)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let landmarks = try JSONDecoder().decode(APIRecord.self, from: data)
        
        return landmarks.record
    }
}
