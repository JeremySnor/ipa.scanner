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
            
            switch item.value {
            case let singleString as String:
                addValue(
                    .single(singleString),
                    forKey: key,
                    intoLocale: locale
                )
                
            case let dictionary as NSDictionary:
                guard let plural = LocalizationPlural(dictionary: dictionary) else {
                    continue
                }
                addValue(
                    .plural(plural),
                    forKey: key,
                    intoLocale: locale
                )
                
            default:
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
