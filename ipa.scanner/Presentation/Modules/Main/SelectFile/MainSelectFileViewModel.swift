//
//  MainSelectFileViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class MainSelectFileViewModel: ViewModel<MainSelectFileAction> {
    
    // MARK: - Bindings
    
    @Published
    var fileImporterPresented: Bool = false
    
    @Published
    var selectedIpaURL: URL?
    
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
            let url = try await FileSelectingFlow(importerResult: importerResult).execute()
            await updateBinding { selectedIpaURL = url }
            
        case .accept:
            break
        }
    }
    
}
