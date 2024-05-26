//
//  AnalysisTranslationsViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class AnalysisTranslationsViewModel: ViewModel<AnalysisTranslationsAction> {
    
    let localizationCollection: LocalizationCollection
    
    init(
        localizationCollection: LocalizationCollection,
        navigationContext: NavigationContext
    ) {
        self.localizationCollection = localizationCollection
        super.init(navigationContext: navigationContext)
    }
    
}
