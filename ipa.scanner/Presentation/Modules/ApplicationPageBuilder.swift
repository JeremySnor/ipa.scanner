//
//  ModulePageBuilder.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class ApplicationPageBuilder: PageBuilder {
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func destinationFor(
        page: ApplicationPage,
        navigationContext: NavigationContext
    ) -> PageView {
        
        switch page {
        case .mainSelectFile:
            let viewModel = MainSelectFileViewModel(
                shellService: dependencies.shellService,
                finderService: dependencies.finderService,
                localizationCollectorService: dependencies.localizationCollectorService,
                navigationContext: navigationContext
            )
            return MainSelectFileView(viewModel: viewModel).asPageView()
            
        case let .analysisTranslations(localizationCollection):
            let viewModel = AnalysisTranslationsViewModel(
                localizationCollection: localizationCollection,
                navigationContext: navigationContext
            )
            return AnalysisTranslationsView(viewModel: viewModel).asPageView()
        }
        
    }
    
}
