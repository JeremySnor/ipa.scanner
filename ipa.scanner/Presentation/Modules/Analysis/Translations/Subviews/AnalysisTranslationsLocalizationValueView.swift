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
                    case .plural:
                        EmptyView()
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
    
}

#Preview {
    ZStack {
        Color.white
        
        AnalysisTranslationsLocalizationValueView(
            locale: Locale(identifier: "en"),
            localizationValue: .single("Hello")
        )
        .padding(14)
    }
    .frame(width: 300, height: 300)
}
