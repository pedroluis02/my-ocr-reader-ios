//
//  TextRecogizerService.swift
//  MyOcrReader
//
//  Created by Pedro Luis on 8/07/23.
//

import CoreMedia

protocol TextRecognizerService {
    func recognize(_ data: Data, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void)
    func recognize(_ buffer: CMSampleBuffer,_ isBackPosition: Bool, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void)
}
