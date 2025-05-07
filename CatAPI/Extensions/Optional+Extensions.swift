//
//  Optional+Extensions.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation


extension Optional where Wrapped == String  {
    var stringValue: String {
        guard let self else { return "" }
        return self
        
    }
}
