//
//  MainSelectFileViewModel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

class MainSelectFileViewModel: ViewModel {
    
    @Published
    var selectedFileName: String?
    
    var hintText: String {
        if selectedFileName == nil {
            return "Для начала необходимо выбрать .ipa файл"
        } else {
            return "Нажмите \"продолжить\" или выберите другой файл"
        }
    }
    
    var isAcceptVisible: Bool {
        selectedFileName != nil
    }
    
    func selectFile() {
        
    }
    
    func accept() {
        navigationContext.push(page: AnalysisModulePage.translations)
    }
    
}
