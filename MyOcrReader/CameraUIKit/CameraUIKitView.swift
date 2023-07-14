//
//  CameraUIKitView.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 11/07/23.
//

import SwiftUI

struct CameraUIKitView : UIViewControllerRepresentable {
    private var imageAnalyzer: CameraImageAnalyzer? = nil
    
    init(imageAnalyzer: CameraImageAnalyzer? = nil) {
        self.imageAnalyzer = imageAnalyzer
    }
    
    func makeUIViewController(context: Context) -> CameraUIViewController {
        return CameraUIViewController(imageAnalyzer: imageAnalyzer)
    }
    
    func updateUIViewController(_ uiViewController: CameraUIViewController, context: Context) {
    }
}
