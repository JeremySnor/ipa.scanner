//
//  Page.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import Foundation

protocol Page: Hashable, Identifiable {
    
    var id: String { get }
    
}
