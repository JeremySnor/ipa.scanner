//
//  ViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    let navigationContext: NavigationContext
    
    init(navigationContext: NavigationContext) {
        self.navigationContext = navigationContext
    }
    
}
