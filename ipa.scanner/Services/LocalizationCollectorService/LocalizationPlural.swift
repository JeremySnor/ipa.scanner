//
//  LocalizationPlural.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 01.06.2024.
//

import Foundation

struct LocalizationPlural {
    
    let localizedFormatKey: String
    let formatValueTypeKey: String
    let zero, one, two, few, many, other: String?
    
    init(
        localizedFormatKey: String,
        formatValueTypeKey: String,
        zero: String?,
        one: String?,
        two: String?,
        few: String?, 
        many: String?,
        other: String?
    ) {
        self.localizedFormatKey = localizedFormatKey
        self.formatValueTypeKey = formatValueTypeKey
        self.zero = zero
        self.one = one
        self.two = two
        self.few = few
        self.many = many
        self.other = other
    }
    
    init?(dictionary: NSDictionary) {
        let localizedFormatKey = dictionary["NSStringLocalizedFormatKey"] as? String
        let value = dictionary["value"] as? NSDictionary
        guard let localizedFormatKey, let value else {
            return nil
        }
        
        let formatValueTypeKey = value["NSStringFormatValueTypeKey"] as? String
        guard let formatValueTypeKey else {
            return nil
        }
        
        self.localizedFormatKey = localizedFormatKey
        self.formatValueTypeKey = formatValueTypeKey
        zero = value["zero"] as? String
        one = value["one"] as? String
        two = value["two"] as? String
        few = value["few"] as? String
        many = value["many"] as? String
        other = value["other"] as? String
    }
    
}
