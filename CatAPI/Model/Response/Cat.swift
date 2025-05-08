//
//  Cat.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation

// MARK: - Cat
class Cat: Codable {
    let id: String
    let url: String
    let width, height: Int
}
