//
//  AnalysisTranslationsKeysList.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import SwiftUI

struct AnalysisTranslationsKeysList: View {
    
    let localizations: [Localization]
    let locales: [Locale]
    
    @Binding
    var selectedLocalization: Localization?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Ключи локализации")
                .font(.system(size: 16, weight: .medium))
                .padding([.top, .horizontal], 14)
            
            ScrollView {
                LazyVStack {
                    ForEach(localizations) { localization in
                        AnalysisTranslationsKeysListRow(
                            localization: localization,
                            isSelected: localization.id == selectedLocalization?.id,
                            isFilled: locales.allSatisfy { localization.storage.keys.contains($0) }
                        )
                        .onTapGesture(perform: {
                            selectedLocalization = localization
                        })
                    }
                }
                .padding(14)
            }
        }
    }
    
}

#Preview {
    ZStack {
        Color.white
        
        AnalysisTranslationsKeysList(
            localizations: LocalizationCollection.mockInstance().storage.values.map { $0 },
            locales: Array(LocalizationCollection.mockInstance().locales),
            selectedLocalization: .constant(nil)
        )
    }
    .frame(width: 300, height: 500)
}
