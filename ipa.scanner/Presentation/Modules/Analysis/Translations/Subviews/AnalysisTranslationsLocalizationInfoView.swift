//
//  AnalysisTranslationsLocalizationInfoView.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import SwiftUI

struct AnalysisTranslationsLocalizationInfoView: View {
    
    let locales: [Locale]
    
    @Binding
    var localization: Localization?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Локализация")
                .font(.system(size: 16, weight: .medium))
                .padding([.top, .horizontal], 14)
            
            ZStack {
                Color.white
                
                if let localization {
                    ScrollView {
                        LazyVStack {
                            ForEach(locales, id: \.identifier) { locale in
                                AnalysisTranslationsLocalizationValueView(
                                    locale: locale,
                                    localizationValue: localization.storage[locale]
                                )
                            }
                        }
                        .padding(14)
                    }
                } else {
                    Text("Выберите ключ из списка")
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .asCardView()
                        .padding(14)
                }
            }
        }
    }
    
}

#Preview {
    ZStack {
        Color.white
        
        AnalysisTranslationsLocalizationInfoView(
            locales: Array(LocalizationCollection.mockInstance().locales),
            localization: .constant(LocalizationCollection.mockInstance().storage.values.first!)
        )
    }
    .frame(width: 300, height: 500)
}
