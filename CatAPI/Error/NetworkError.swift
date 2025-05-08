//
//  NetworkError.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case unknownError(Error)
    
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            "Enter a valid URL"
        case .invalidResponse:
            "The response is invalid please check it."
        case .invalidStatusCode(let code):
            "Your status code is that: \(code)"
        case .unknownError(let error):
            "The error is that: \(error)"
        }
    }
}
