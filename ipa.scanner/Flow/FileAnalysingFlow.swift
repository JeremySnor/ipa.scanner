//
//  FileAnalysingFlow.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

enum FileAnalysingError: LocalizedError {
    
    case applicationBundleNotFound
    
}

struct FileAnalysingFlow: Printer {
    
    let ipaFileURL: URL
    let shellService: ShellService
    let finderService: FinderService
    let localizationCollectorService: LocalizationCollectorService
    
    func execute() async throws {
        let zipFileURL = ipaFileURL.deletingPathExtension().appendingPathExtension("zip")
        let extractionFolderURL = ipaFileURL.deletingPathExtension()
        
        #if DEBUG
        print(info: "Coping content from \(ipaFileURL.path) to \(zipFileURL.path)")
        #endif
        try shellService.shell(command: "cp", arguments: [ipaFileURL.path, zipFileURL.path])
        
        #if DEBUG
        print(info: "Extracting content from \(zipFileURL.path) to \(extractionFolderURL.path)")
        #endif
        try shellService.shell(command: "unzip", arguments: [zipFileURL.path, "-d", extractionFolderURL.path])
        
        guard let mainAppDirectoryURL = try finderService.recursiveSearch(directoryWithName: "main.app", inDirectory: extractionFolderURL) else {
            throw FileAnalysingError.applicationBundleNotFound
        }
        #if DEBUG
        print(info: "Found bundle at \(mainAppDirectoryURL.path)")
        #endif
        
        let localizationDirectories = try finderService.findAllDirectoriesWithSuffix(
            ".lproj",
            excludes: ["Base.lproj"],
            inDirectory: mainAppDirectoryURL
        )
        #if DEBUG
        let localizationDirectoriesNames = localizationDirectories.map { $0.lastPathComponent }
        print(info: "Found localization directories:\n" + localizationDirectoriesNames.joined(separator: "\n"))
        #endif
        
        let localizationCollection = try localizationCollectorService.collect(fromDirectories: localizationDirectories)
        #if DEBUG
        print(info: "\(localizationCollection)")
        #endif
    }
    
}
