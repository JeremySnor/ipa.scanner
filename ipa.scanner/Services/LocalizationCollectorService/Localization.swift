//
//  Localization.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class Localization {
    
    let key: String
    private(set) var storage: [Locale: LocalizationValue]
    
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
