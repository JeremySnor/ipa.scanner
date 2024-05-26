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
        Color.black
    }
    
}

#Preview {
    AnalysisTranslationsView(
        viewModel: AnalysisTranslationsViewModel(
            localizationCollection: LocalizationCollection(),
            navigationContext: NavigationContext()
        )
    )
}
