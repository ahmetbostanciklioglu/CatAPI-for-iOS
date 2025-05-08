//
//  ContentView.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI
import SwiftData

struct CatsView: View {
    @StateObject private var catViewModel = CatViewModel()
    @Environment(\.modelContext) var modelContext
    @Query private var catsData: [CatDatabase]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(catsData) { cat in
                    if let url = URL(string: cat.image) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 400)
                                .imageScale(.large)
                        } placeholder: {
                            Image(systemName: "photo.circle.fill")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
            }
        }
        .task {
            await catViewModel.fetchCats()
            saveFetchedCats()
        }
        .ignoresSafeArea()
    }
    
    private func saveFetchedCats() {
        guard let fetchedCats = catViewModel.cats else { return }
        
        for cat in fetchedCats {
            let newCat = CatDatabase(image: cat.url)
            modelContext.insert(newCat)
        }  
    }
}

#Preview {
    CatsView()
        .modelContainer(for: CatDatabase.self, inMemory: false)
}



