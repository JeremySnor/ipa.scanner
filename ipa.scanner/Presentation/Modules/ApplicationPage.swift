//
//  ApplicationPage.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

enum ApplicationPage: Page {
    
    // MARK: - Main module
    
    case mainSelectFile
    
    // MARK: - Analysis module
    
    case analysisTranslations(localizationCollection: LocalizationCollection)
    
    // MARK: - Identifiable
    
    var id: String {
        switch self {
        case .mainSelectFile:
            return "MainModule.SelectFile"
            
        case .analysisTranslations:
            return "AnalysisModule.Translations"
        }
    }
    
    // MARK: - Hashable & Equatable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: ApplicationPage, rhs: ApplicationPage) -> Bool {
        lhs.id == rhs.id
    }
    
}
