//
//  CameraUIKitView.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 11/07/23.
//

import SwiftUI

struct CameraUIKitView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraUIViewController {
        return CameraUIViewController()
    }
    
    func updateUIViewController(_ uiViewController: CameraUIViewController, context: Context) {
    }
}
