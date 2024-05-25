//
//  Page.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import Foundation

struct Page: Hashable, Identifiable {
    
    let id: String
    
    init(_ id: String) {
        self.id = id
    }
    
}
