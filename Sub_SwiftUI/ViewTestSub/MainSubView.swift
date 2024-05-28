//
//  MainSubView.swift
//  Sub_SwiftUI
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import SwiftUI

struct MainSubView: View {
    @EnvironmentObject var reachability : RechbilitY_ThorfinnApp
    @EnvironmentObject var iapManager: IAPManager_
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Подписка на вход")
                    .font(.title)
                Text("Страница появится после успешной оплаты подписки на вход")
                    .font(.subheadline)
                    .padding()
                
                // ModsScreen
                logicButtonView(
                    access: iapManager.boughtProducts.contains(.modsType), isShown: $iapManager.isShown,
                    name: "Моды",
                    linkButton:
                        ContentSubView1()
                        .navigationBarHidden(true)
                )
                .fullScreenCover(isPresented: $iapManager.isShown, content: {
                    SubView_ThorFinnApp(subViewModel: SUBVM_ThorfinnApp(productType: PrductTpe_ThorfinnApp.modsType), isShown: $iapManager.isShown)
                        .environmentObject(iapManager)
                })
            }
        }
    }
    
    struct logicButtonView<Destination: View>: View {
        var access: Bool
        @Binding var isShown: Bool
        var name: String
        var linkButton: Destination
        var body: some View {
            if access{
                NavigationLink {
                    linkButton
                } label: {
                    MenuButtonView(name: name, access: access)
                }

            } else {
                Button {
                    isShown.toggle()
                } label: {
                    MenuButtonView(name: name, access: access)
                }
            }
        }
    }
    
    struct MenuButtonView: View {
        var name: String
        let access: Bool
        var body: some View {
            VStack (spacing: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20){
                Text(name)
                    .fontWeight(.semibold)
                    .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 20 : 32 ))
            }
            .foregroundStyle(.white)
            .font(.headline)
            .frame(width: 100, height: 50)
            .padding()
            .background( Color(#colorLiteral(red: 0.4627384543, green: 0.5104349256, blue: 0.457896769, alpha: 1)))
            .cornerRadius(UIDevice.current.userInterfaceIdiom == .phone ? 15 : 30)
            .overlay(content: {
                if (access == false){
                    VStack {
                        Image("lock_mods")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                    .frame(width: 120, height: 70, alignment: .topTrailing)
                }
            })
            .padding(.horizontal, 5)
        }
    }
}

#Preview {
    MainSubView()
}
