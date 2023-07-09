//
//  MLKitTextRecognizer.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 8/07/23.
//

import UIKit
import MLKit

class MLKitTextRecognizer: TextRecognizerService {
    private let emptyResultError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Result does not contains data"])
    
    func recognize(_ data: Data, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void) {
        let visionImage = createVisionImage(data)
        processImage(visionImage, success: success, failure: failure)
    }
    
    private func createVisionImage(_ data: Data) -> VisionImage {
        let image = UIImage(data: data)!
        let visionImage = VisionImage(image: image)
        
        visionImage.orientation = image.imageOrientation
        
        return visionImage
    }
    
    private func processImage(_ visionImage: VisionImage, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void) {
        let options = TextRecognizerOptions.init()
        let textRecognizer = TextRecognizer.textRecognizer(options: options)
        textRecognizer.process(visionImage) { result, error in
            if (error != nil) {
                failure(error!)
                return
            }
            
            guard let result = result else {
                failure(self.emptyResultError)
                return
            }
            
            let allLines = self.extractAllLines(result)
            success(allLines)
        }
    }
    
    private func extractAllLines(_ result: Text) -> [String]{
        var lines = [String]()
        for block in result.blocks {
            for line in block.lines {
                lines.append(line.text)
            }
        }
        
        return lines
    }
}
