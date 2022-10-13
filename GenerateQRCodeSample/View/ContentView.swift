//
//  ContentView.swift
//  GenerateQRCodeSample
//

import SwiftUI

struct ContentView: View {
    
    @State private var qrCodeImage: UIImage?
    private let qrCodeGenerator = QRCodeGenerator()
    private let photoSaver = PhotoSaver()
    private let inputUrlString = "https://dev.classmethod.jp/author/littleossa/"
    
    var body: some View {
        VStack(spacing: 16) {
            
            if let qrCodeImage {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                
            } else {
                ReloadButton {
                    qrCodeImage = qrCodeGenerator.generate(with: inputUrlString)
                }
            }
            
            Text("Hello, QRCode!")
            
            Button {
                photoSaver.save(image: qrCodeImage!) { error in
                    if let error {
                        print(error)
                    }
                }
            } label: {
                Text("save")
            }

        }
        .padding()
        .onAppear {
            qrCodeImage = qrCodeGenerator.generate(with: inputUrlString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
