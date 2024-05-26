//
//  AnalysisTranslationsKeysListRow.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import SwiftUI

struct AnalysisTranslationsKeysListRow: View {
    
    let localization: Localization
    let isSelected: Bool
    let isFilled: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            if isSelected {
                Color.blue
                    .frame(width: 4)
            }
            
            HStack {
                Text(localization.key)
                    .font(.system(size: 16, weight: isSelected ? .medium : .regular))
                    .foregroundStyle(isFilled ? .black : .orange)
                
                if !isFilled {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(.orange)
                }
            }
            .padding(14)
        }
        .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
        .asCardView()
        .fixedSize(horizontal: false, vertical: true)
    }
    
}

#Preview {
    ZStack {
        Color.white
        
        VStack {
            AnalysisTranslationsKeysListRow(
                localization: LocalizationCollection.mockInstance().storage.first!.value,
                isSelected: false,
                isFilled: true
            )
            
            AnalysisTranslationsKeysListRow(
                localization: LocalizationCollection.mockInstance().storage.first!.value,
                isSelected: true,
                isFilled: false
            )
        }
        .padding(14)
    }
    .frame(width: 300, height: 300)
}
