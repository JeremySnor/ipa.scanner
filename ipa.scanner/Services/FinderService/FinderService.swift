//
//  FinderService.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class FinderService: Printer {
    
    private let fileManager: FileManager
    
    init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
    
    func recursiveSearch(
        directoryWithName directoryName: String,
        inDirectory directoryURL: URL
    ) throws -> URL? {
        let directoriesURLs: [URL] = try fileManager.contentsOfDirectory(
            at: directoryURL,
            includingPropertiesForKeys: [.isDirectoryKey]
        )
        
        guard directoriesURLs.isNotEmpty else {
            return nil
        }
        
        let directoryURL = directoriesURLs.first { $0.lastPathComponent == directoryName }
        
        if let directoryURL {
            return directoryURL
        } else {
            for directoryURL in directoriesURLs {
                let directoryURL = try recursiveSearch(
                    directoryWithName: directoryName,
                    inDirectory: directoryURL
                )
                if let directoryURL {
                    return directoryURL
                }
            }
        }
        
        return nil
    }
    
    func findAllDirectoriesWithSuffix(
        _ suffix: String,
        excludes: [String] = [],
        inDirectory directoryURL: URL
    ) throws -> [URL] {
        let directoriesURLs: [URL] = try fileManager.contentsOfDirectory(
            at: directoryURL,
            includingPropertiesForKeys: [.isDirectoryKey]
        )
        let filteredDirectoriesURLs = directoriesURLs.filter {
            !excludes.contains($0.lastPathComponent) && $0.path.hasSuffix(suffix)
        }
        return filteredDirectoriesURLs
    }
    
}
