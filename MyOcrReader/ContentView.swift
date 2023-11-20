//
//  ContentView.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 29/06/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    private var imageAnalyzer: CameraImageAnalyzer? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "swift")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("OCR Reader").padding()
                PhotosPicker(selection: $viewModel.selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Load an image")
                }.onChange(of: viewModel.selectedItem, perform: viewModel.loadNewImage)
                NavigationLink() {
                    CameraUIKitView(imageAnalyzer: imageAnalyzer)
                        .ignoresSafeArea()
                } label: {
                    Text("Open camera")
                }.padding(.top, 4)
            }.navigationDestination(isPresented: $viewModel.presentNextView) {
                textRecognizerView($viewModel.selectedImageData)
                    .navigationBarTitle("Text Recognition", displayMode: .inline)
            }.alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text("Load Image"), message: Text(viewModel.lastErrorMessage), dismissButton: .cancel(Text("OK")))
            }
        }
    }
}

@ViewBuilder
private func textRecognizerView(_ imageData: Binding<Data?>) -> some View {
    let viewModel = TextRecognizerViewModel(imageData)
    TextRecognizerView(viewModel: viewModel)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
