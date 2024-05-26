//
//  ViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class ViewModel<Action>: ObservableObject, Printer {
    
    let navigationContext: NavigationContext
    
    init(navigationContext: NavigationContext) {
        self.navigationContext = navigationContext
    }
    
    @MainActor
    func updateBinding(_ update: () -> Void) {
        update()
    }
    
    func handleAction(_ action: Action) {
        Task {
            do {
                try await processAction(action)
            } catch {
                #if DEBUG
                print(error: error)
                #endif
                await navigationContext.showError(error)
            }
        }
    }
    
    func processAction(_ action: Action) async throws { }
    
}
