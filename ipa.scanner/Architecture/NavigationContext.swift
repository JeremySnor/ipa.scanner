//
//  NavigationContext.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import SwiftUI

class NavigationContext: ObservableObject {
    
    @Published
    var pages: NavigationPath = .init()
    
    func push(page: Page) {
        pages.append(page)
    }
    
    func pop() {
        pages.removeLast()
    }
    
}
