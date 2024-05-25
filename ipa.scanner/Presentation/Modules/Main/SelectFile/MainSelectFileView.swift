//
//  MainSelectFileView.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import SwiftUI

struct MainSelectFileView: View {
    
    @StateObject
    var viewModel: MainSelectFileViewModel
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                TextLabel(text: viewModel.hintText)
                
                PrimaryButton(
                    title: "Выбрать файл",
                    idealWidth: 160,
                    action: { viewModel.handleAction(.openFileSelector) }
                )
                
                if viewModel.isAcceptVisible {
                    PrimaryButton(
                        title: "Продолжить",
                        idealWidth: 160,
                        action: { viewModel.handleAction(.accept) }
                    )
                }
            }
        }
        .navigationTitle("ipa Scanner")
        .fileImporter(
            isPresented: $viewModel.fileImporterPresented,
            allowedContentTypes: [.data],
            onCompletion: { viewModel.handleAction(.processFileImporterResult($0)) }
        )
    }
    
}

#Preview {
    MainSelectFileView(
        viewModel: MainSelectFileViewModel(
            navigationContext: NavigationContext()
        )
    )
    .frame(width: 600, height: 400, alignment: .center)
}
