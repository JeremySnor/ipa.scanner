//
//  LocalizationCollection.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class LocalizationCollection {
    
    private(set) var locales: Set<Locale> = []
    private(set) var storage: [String: Localization] = [:]
    
    func append(localizationDictionary: NSDictionary, for locale: Locale) {
        locales.insert(locale)
        
        for item in localizationDictionary {
            guard let key = item.key as? String else {
                continue
            }
            
            if let singleString = item.value as? String {
                addValue(
                    .single(singleString),
                    forKey: key,
                    intoLocale: locale
                )
                continue
            }
            
            if let pluralDictionary = item.value as? NSDictionary {
                continue
            }
        }
    }
    
    private func addValue(
        _ localizationValue: LocalizationValue,
        forKey key: String,
        intoLocale locale: Locale
    ) {
        if let localization = storage[key] {
            localization.addValue(
                localizationValue,
                forLocale: locale
            )
        } else {
            storage[key] = Localization(
                key: key,
                localizationValue: localizationValue,
                locale: locale
            )
        }
    }
    
}

