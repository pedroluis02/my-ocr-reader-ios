//
//  ContentViewModel.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 3/07/23.
//

import Foundation
import SwiftUI

class TextRecognizerViewModel: ObservableObject {
    private var recognizer: TextRecognizerService
    
    @Binding var imageData: Data?
    @Published var textLines: [String] = []

    init(_ imageData: Binding<Data?>, recognizer: TextRecognizerService = MLKitTextRecognizer()) {
        self._imageData = imageData
        self.recognizer = recognizer
        
        if self.$imageData.wrappedValue != nil{
            process()
        }
    }
    
    private func process() {
        recognizer.recognize(imageData!) { lines in
            self.textLines = lines
        } failure: { error in
            print("Text recognizer: \(error)")
        }
    }
}
