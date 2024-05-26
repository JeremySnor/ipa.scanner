//
//  LocalizationCollection.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

final class LocalizationCollection {
    
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
    
    #if DEBUG
    func appendLocale(_ locale: Locale) {
        locales.insert(locale)
    }
    #endif
    
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

#if DEBUG
extension LocalizationCollection: Mock {
    
    static func mockInstance() -> LocalizationCollection {
        let collection = LocalizationCollection()
        
        let ruLocale = Locale(identifier: "ru")
        collection.appendLocale(ruLocale)
        let enLocale = Locale(identifier: "en")
        collection.appendLocale(enLocale)
        
        collection.addValue(.single("Привет"), forKey: "hello", intoLocale: ruLocale)
        collection.addValue(.single("Hello"), forKey: "hello", intoLocale: enLocale)
        
        collection.addValue(.single("How are you?"), forKey: "how_are_you_question", intoLocale: enLocale)
        
        return collection
    }
    
}
#endif
