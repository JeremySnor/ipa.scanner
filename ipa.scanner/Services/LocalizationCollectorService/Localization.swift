//
//  Localization.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class Localization: Identifiable {
    
    let key: String
    private(set) var storage: [Locale: LocalizationValue]
    
    var id: String {
        key
    }
    
    init(
        key: String,
        localizationValue: LocalizationValue,
        locale: Locale
    ) {
        self.key = key
        self.storage = [locale: localizationValue]
    }
    
    func addValue(
        _ localizationValue: LocalizationValue,
        forLocale locale: Locale
    ) {
        storage[locale] = localizationValue
    }
    
}
