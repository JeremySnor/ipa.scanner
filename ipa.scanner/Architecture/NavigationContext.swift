//
//  NavigationContext.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import SwiftUI

final class NavigationContext: ObservableObject {
    
    // MARK: - Stack navigation
    
    @Published
    var pages: NavigationPath = .init()
    
    // MARK: - Error
    
    @Published
    var isErrorPresented: Bool = false
    
    @Published
    var error: Error?
    
}

@MainActor
extension NavigationContext {
    
    func push<P: Page>(page: P) {
        pages.append(page)
    }
    
    func pop() {
        pages.removeLast()
    }
    
    func showError(_ error: Error) {
        self.error = error
        isErrorPresented = true
    }
    
    func hideError() {
        isErrorPresented = false
        error = nil
    }
    
}
