//
//  AnalysisTranslationsViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class AnalysisTranslationsViewModel: ViewModel<AnalysisTranslationsAction> {
    
    private let localizationCollection: LocalizationCollection
    
    let locales: [Locale]
    let localizations: [Localization]
    
    @Published
    var selectedLocalization: Localization?
    
    init(
        localizationCollection: LocalizationCollection,
        navigationContext: NavigationContext
    ) {
        self.localizationCollection = localizationCollection
        self.locales = Array(localizationCollection.locales)
        self.localizations = Array(localizationCollection.storage.values)
        super.init(navigationContext: navigationContext)
    }
    
}
