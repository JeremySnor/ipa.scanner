//
//  FileSelectingFlow.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import Foundation

enum FileSelectingError: LocalizedError {
    
    case fileIsNotIpa
    
    var errorDescription: String? {
        switch self {
        case .fileIsNotIpa:
            return "Выбранный вами файл имеет расширение отличное от *.ipa"
        }
    }
    
}

struct FileSelectingFlow {
    
    let importerResult: Result<URL, Error>
    
    func execute() async throws -> URL {
        let url = try importerResult.get()
        
        guard url.pathExtension.lowercased() == "ipa" else {
            throw FileSelectingError.fileIsNotIpa
        }
        
        return url
    }
    
}
