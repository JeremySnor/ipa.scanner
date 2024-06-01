//
//  LocalizationCollectorService.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

final class LocalizationCollectorService: Printer {
    
    private let fileManager: FileManager
    
    init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
    
    func collect(fromDirectories directoriesURLs: [URL]) throws -> LocalizationCollection {
        let localizationCollection = LocalizationCollection()
        
        for directoryURL in directoriesURLs {
            let locale = Locale(identifier: directoryURL.deletingPathExtension().lastPathComponent)
            
            let filesURLs = try fileManager.contentsOfDirectory(
                at: directoryURL, 
                includingPropertiesForKeys: [.isRegularFileKey]
            )
            for fileURL in filesURLs {
                if let dictionary = NSDictionary(contentsOfFile: fileURL.path) {
                    localizationCollection.append(localizationDictionary: dictionary, for: locale)
                }
            }
        }
        
        return localizationCollection
    }
    
}
