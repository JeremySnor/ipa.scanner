//
//  AnalysisTranslationsView.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import SwiftUI

struct AnalysisTranslationsView: View {
    
    @StateObject
    var viewModel: AnalysisTranslationsViewModel
    
    var body: some View {
        ZStack {
            Color.white
            
            HStack(spacing: 0) {
                AnalysisTranslationsKeysList(
                    localizations: viewModel.localizations,
                    locales: viewModel.locales,
                    selectedLocalization: $viewModel.selectedLocalization
                )
                .frame(width: 300)
                
                AnalysisTranslationsLocalizationInfoView(
                    locales: viewModel.locales,
                    localization: $viewModel.selectedLocalization
                )
            }
        }
    }
    
}

#Preview {
    AnalysisTranslationsView(
        viewModel: AnalysisTranslationsViewModel(
            localizationCollection: .mockInstance(),
            navigationContext: NavigationContext()
        )
    )
}
