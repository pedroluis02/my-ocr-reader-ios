//
//  CameraImageAnalyzer.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 13/07/23.
//

import CoreMedia

protocol CameraImageAnalyzer {
    func analyze(_ buffer: CMSampleBuffer, isBackPosition: Bool)
}
