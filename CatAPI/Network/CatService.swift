//
//  CatService.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI

actor CatService {
    static let shared = CatService()
    private init() { }
    
    func fetchCatImages() async throws -> [Cat] {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }
        
        do {
            let jsonDecoded = JSONDecoder()
            return try jsonDecoded.decode([Cat].self, from: data)
        } catch {
            throw NetworkError.unknownError(error)
        }
    }
}
