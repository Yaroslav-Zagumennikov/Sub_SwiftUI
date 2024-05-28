//
//  ContentSubView1.swift
//  Sub_SwiftUI
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import SwiftUI

struct ContentSubView1: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{            
            Text("Подписка на контент (Mods)")
                .font(.title)
            Text("Страница появится после успешной оплаты подписки на контент (Mods)")
                .font(.subheadline)
                .padding(.horizontal)
        }
        .overlay{
            VStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
                .padding(40)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topLeading)
            .padding()
        }
    }
}

#Preview {
    ContentSubView1()
}
