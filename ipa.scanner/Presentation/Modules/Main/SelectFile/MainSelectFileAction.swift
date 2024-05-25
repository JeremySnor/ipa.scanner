//
//  MainSelectFileAction.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

enum MainSelectFileAction {
    
    case openFileSelector
    case processFileImporterResult(Result<URL, Error>)
    case accept
    
}
