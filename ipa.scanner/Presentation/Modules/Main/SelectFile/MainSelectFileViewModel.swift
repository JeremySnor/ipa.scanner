//
//  MainSelectFileViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class MainSelectFileViewModel: ViewModel<MainSelectFileAction> {
    
    // MARK: - Injections
    
    private let shellService: ShellService
    private let finderService: FinderService
    
    // MARK: - Init
    
    init(
        shellService: ShellService,
        finderService: FinderService,
        navigationContext: NavigationContext
    ) {
        self.shellService = shellService
        self.finderService = finderService
        super.init(navigationContext: navigationContext)
    }
    
    // MARK: - Bindings
    
    @Published
    var fileImporterPresented: Bool = false
    
    @Published
    var selectedIpaURL: URL?
    
    @Published
    var ipaProcessing: Bool = false
    
    var hintText: String {
        if let selectedIpaURL {
            return "Нажмите \"Продолжить\" чтобы использовать \(selectedIpaURL.lastPathComponent) или выберите другой файл"
        } else {
            return "Для начала необходимо выбрать .ipa файл"
        }
    }
    
    var selectedIpaName: String? {
        selectedIpaURL?.lastPathComponent
    }
    
    var isAcceptVisible: Bool {
        selectedIpaURL != nil
    }
    
    // MARK: - Actions
    
    override func processAction(_ action: MainSelectFileAction) async throws {
        switch action {
        case .openFileSelector:
            await updateBinding { fileImporterPresented = true }
            
        case let .processFileImporterResult(importerResult):
            let flow = FileSelectingFlow(importerResult: importerResult)
            let url = try await flow.execute()
            await updateBinding { selectedIpaURL = url }
            
        case .accept:
            guard let selectedIpaURL else { return }
            await updateBinding { ipaProcessing = true }
            let flow = FileAnalysingFlow(
                ipaFileURL: selectedIpaURL,
                shellService: shellService,
                finderService: finderService
            )
            try await flow.execute()
            await updateBinding { ipaProcessing = false }
        }
    }
    
}
