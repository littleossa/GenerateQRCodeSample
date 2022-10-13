//
//  ReloadButton.swift
//  GenerateQRCodeSample
//

import SwiftUI

struct ReloadButton: View {
    
    let action: () -> Void
    
    var body: some View {
        
        VStack {
            Text("データを取得出来ませんでした")
            
            Button {
                action()
            } label: {
                Text("再取得")
            }
        }
    }
}

struct ReloadButton_Previews: PreviewProvider {
    static var previews: some View {
        ReloadButton(action: {})
    }
}
