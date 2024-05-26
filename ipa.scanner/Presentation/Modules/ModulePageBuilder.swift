//
//  ModulePageBuilder.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class ModulePageBuilder: PageBuilder {
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func destinationFor(
        page: Page,
        navigationContext: NavigationContext
    ) -> PageView {
        
        switch page {
        case MainModulePage.selectFile:
            let viewModel = MainSelectFileViewModel(
                shellService: dependencies.shellService,
                finderService: dependencies.finderService,
                localizationCollectorService: dependencies.localizationCollectorService,
                navigationContext: navigationContext
            )
            return MainSelectFileView(viewModel: viewModel).asPageView()
            
        case AnalysisModulePage.translations:
            let viewModel = AnalysisTranslationsViewModel(navigationContext: navigationContext)
            return AnalysisTranslationsView(viewModel: viewModel).asPageView()
            
        default:
            fatalError("Undefined page")
        }
        
    }
    
}
