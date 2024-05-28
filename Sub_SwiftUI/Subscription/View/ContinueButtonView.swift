//
//  ContinueButton.swift
//  Tamagochi
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import SwiftUI

struct CntnUeButt_ThorfinnApp: View {
    
    @EnvironmentObject var iapViewModel: IAPManager_
    @EnvironmentObject var reachability : RechbilitY_ThorfinnApp

    @ObservedObject var SubViewModel_SimulatorFarm: SUBVM_ThorfinnApp
    
    @State private var isScaled: Bool = false
    @Binding var isShown: Bool
    @State private var showAlert: Bool = false
    var thirdScr: Bool

    var body: some View {
        Button(action: {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()

            if !reachability.isConnected && thirdScr {
                showAlert = !reachability.isConnected
                return
            }
            
            withAnimation(Animation.easeIn(duration: 0.5)) {
                if SubViewModel_SimulatorFarm.currentStage == .third {
                    if reachability.isConnected{
                        iapViewModel.purchaseProduct(of: SubViewModel_SimulatorFarm.productType)
                    }
                } else {
                    SubViewModel_SimulatorFarm.conTButTActon_SUB_Thorf()
                }
            }
        }, label: {
            ZStack {
                Color(#colorLiteral(red: 0.4914765358, green: 0.4914765358, blue: 0.4914765358, alpha: 1))
                HStack{
                    Image("ArrowButContinue")
                    .opacity(0.0)
                    .padding(.trailing)
                    Spacer()
                    Text(localizedString(forKey: "iOSButtonID"))
                        .font(Font.custom("Gilroy-Black", size: 32))
                        .foregroundStyle(Color(#colorLiteral(red: 0.6189979911, green: 0.8866835237, blue: 1, alpha: 1)))
                    Spacer()
                    HStack{
                        let shouldRotateImage = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight ? true : false
                        Image("ArrowButContinue")
                            .rotationEffect(Angle(degrees: shouldRotateImage ? 0 : 180))
                    }
                    .padding(.leading)
                }
                .padding()
                
            }
            .cornerRadius(16)
        })
        .disabled(iapViewModel.isPurchasing)
        .font(Font.custom("Gilroy-Black", size: 32))
        .foregroundColor(.white)
        .scaleEffect(isScaled ? 1 : 0.75)
        .onAppear {
            isScaled = true
        }
        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isScaled)
        .alert("Error", isPresented: $showAlert, actions: {
            Button(action: {
                showAlert = false
            }, label: {
                Text("OK")
            })
        }, message: {
            Text(localizedString(forKey:"Text31ID"))
        })
    }
    
}

struct CntnUeButt_ThorfinnApp_Preview: PreviewProvider {
    static var previews: some View {
        @StateObject var subViewModel = SUBVM_ThorfinnApp(productType: .mainType)
        
        @State var isShown = true
        
        CntnUeButt_ThorfinnApp(SubViewModel_SimulatorFarm: subViewModel, isShown: $isShown, thirdScr: true)
            .environmentObject(IAPManager_())
            .previewLayout(PreviewLayout.fixed(width: 500, height: 100))
    }
}

