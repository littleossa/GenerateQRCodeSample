//
//  QRCodeGenerator.swift
//  GenerateQRCodeSample
//

import SwiftUI

struct QRCodeGenerator {
        
    func generate(with inputText: String) -> UIImage? {
        
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator")
        else { return nil }
        
        let inputData = inputText.data(using: .utf8)
        qrFilter.setValue(inputData, forKey: "inputMessage")
        // 誤り訂正レベルをHに指定
        qrFilter.setValue("H", forKey: "inputCorrectionLevel")
        
        guard let ciImage = qrFilter.outputImage
        else { return nil }
        
        // CIImageは小さい為、任意のサイズに拡大
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCiImage = ciImage.transformed(by: sizeTransform)
        
        // CIImageだとSwiftUIのImageでは表示されない為、CGImageに変換
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledCiImage,
                                            from: scaledCiImage.extent)
        else { return nil }
                
        return UIImage(cgImage: cgImage).composited(withSmallCenterImage: UIImage(named: "icon_cute")!)
    }
}
