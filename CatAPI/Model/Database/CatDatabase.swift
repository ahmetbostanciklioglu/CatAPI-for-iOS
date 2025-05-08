//
//  CatSwiftData.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation
import SwiftData

@Model
final class CatDatabase {
    var image: String = ""
    
    init(image: String) {
        self.image = image
    }
}
