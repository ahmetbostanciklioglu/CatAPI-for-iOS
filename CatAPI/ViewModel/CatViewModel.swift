//
//  CatViewModel.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation


@MainActor
final class CatViewModel: ObservableObject {
    @Published var cats: [Cat]?
    @Published var errorMessage: String = ""
    
    let service = CatService.shared
    
    func fetchCats() async {
        do {
            cats = try await service.fetchCatImages()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
