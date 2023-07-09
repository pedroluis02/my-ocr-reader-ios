//
//  ContentViewModel.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 8/07/23.
//

import Foundation
import SwiftUI
import PhotosUI

class ContentViewModel: ObservableObject {
    @Published var presentNextView: Bool = false
    @Published var selectedItem: PhotosPickerItem? = nil
    @Published var selectedImageData: Data? = nil
     
    func loadNewImage(newItem: PhotosPickerItem?) {
        Task {
            do {
                let data = try await newItem?.loadTransferable(type: Data.self)
                selectedImageData = data
                presentNextView = true
            } catch {
                selectedImageData = nil
                presentNextView = false
                
                print("load image: \(error)")
            }
        }
    }
}
