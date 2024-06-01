//
//  AnalysisTranslationsLocalizationValueView.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import SwiftUI

struct AnalysisTranslationsLocalizationValueView: View {
    
    let locale: Locale
    let localizationValue: LocalizationValue?
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(locale.identifier):")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.gray)
                .frame(minWidth: 28, alignment: .leading)
            
            VStack(alignment: .leading) {
                if let localizationValue {
                    switch localizationValue {
                    case let .single(localizedString):
                        Text(localizedString)
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    case let .plural(plural):
                        if let zero = plural.zero {
                            buildPluralCategoryRow(value: zero, title: "zero")
                        }
                        if let one = plural.one {
                            buildPluralCategoryRow(value: one, title: "one")
                        }
                        if let two = plural.two {
                            buildPluralCategoryRow(value: two, title: "two")
                        }
                        if let few = plural.few {
                            buildPluralCategoryRow(value: few, title: "few")
                        }
                        if let many = plural.many {
                            buildPluralCategoryRow(value: many, title: "many")
                        }
                        if let other = plural.other {
                            buildPluralCategoryRow(value: other, title: "other")
                        }
                    }
                } else {
                    Text("Не определено")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity)
        .asCardView()
    }
    
    @ViewBuilder
    private func buildPluralCategoryRow(
        value: String,
        title: String
    ) -> some View {
        HStack {
            Group {
                Text(value)
                    .font(.system(size: 14))
                    .foregroundStyle(.black) +
                
                Text(" (\(title))")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}

#Preview {
    ZStack {
        Color.white
        
        VStack {
            AnalysisTranslationsLocalizationValueView(
                locale: Locale(identifier: "en"),
                localizationValue: .single("Hello")
            )
            
            AnalysisTranslationsLocalizationValueView(
                locale: Locale(identifier: "en"),
                localizationValue: .plural(LocalizationPlural(
                    localizedFormatKey: "%#@homes@",
                    formatValueTypeKey: "d",
                    zero: nil,
                    one: "1 month ago",
                    two: nil,
                    few: nil,
                    many: nil,
                    other: "%d months ago")
                )
            )
        }
        .padding(14)
    }
    .frame(width: 300, height: 300)
}
