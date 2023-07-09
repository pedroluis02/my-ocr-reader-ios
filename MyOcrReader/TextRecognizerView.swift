//
//  TextRecognizerView.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 8/07/23.
//

import SwiftUI

struct TextRecognizerView: View {
    @ObservedObject var viewModel: TextRecognizerViewModel
    
    var body: some View {
        List {
            if (viewModel.imageData != nil) {
                let image = UIImage(data: viewModel.imageData!)!
                Section() {
                    HStack {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }
            Section(header: Text("Text lines")) {
                ForEach(viewModel.textLines, id: \.self) { text in
                    Text(text)
                }
            }
        }
    }
}

struct TextRecognizerView_Previews: PreviewProvider {
    static var previews: some View {
        let image = UIImage(systemName: "swift")
        let imageData = image?.pngData()
        let viewModel = TextRecognizerViewModel(.constant(imageData))
        TextRecognizerView(viewModel: viewModel)
    }
}
