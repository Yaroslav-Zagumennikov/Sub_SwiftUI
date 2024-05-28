//
//  SubscriptionView_SimulatorFarm.swift
//  Tamagochi
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import SwiftUI
import AVFoundation

struct SubView_ThorFinnApp: View {
    @EnvironmentObject var reachability : RechbilitY_ThorfinnApp
    @EnvironmentObject var iapViewModel: IAPManager_
    
    @StateObject var subViewModel: SUBVM_ThorfinnApp
    
    @State private var player = AVQueuePlayer()
    @State private var showError = false
    @State private var showAlert = false
    
    @Binding var isShown: Bool
    
    var body: some View {
        mkeMainView_ThorFinnApp()
    }
    
    @ViewBuilder
    private func mkeMainView_ThorFinnApp() -> some View {
        
        GeometryReader { geo in
            ZStack {
                mkePlyRView_ThorfinnApp()
                    .frame(width: geo.size.width, height: geo.size.height)
                Image("backGrouundSub")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .scaledToFill()
                    .offset(y: TypeSystemFORapplication.deviceType == .ipad ? 40 : 0)
                
                if subViewModel.currentStage != .third {
                    makeViewForFirstAndSecondStage_SimulatorFarm(with: geo)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        .zIndex(1)
                }
                else {
                    makScrNThirdStage_ThorfinnApp(with: geo)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
            .onAppear {
                reachability.cancellable = reachability.chkCNetInetConkt()
                subViewModel.updProdPre_SUB_ThorfinnApp(with: iapViewModel.getPrice(of: subViewModel.productType))
                if !iapViewModel.error.isEmpty {
                    showError = true
                }
            }
            .onChange(of: iapViewModel.error, perform: { newValue in
                if !newValue.isEmpty {
                    showError = true
                }
            })
            .onChange(of: iapViewModel.boughtProducts, perform: { newValue in
                if newValue.contains(PrductTpe_ThorfinnApp.modsType) {
                    isShown = false
                } else if newValue.contains(PrductTpe_ThorfinnApp.farmsType) {
                    isShown = false
                }
            })
            .onReceive(reachability.$isConnected) { isConnected in
                showAlert = !isConnected
            }
            .alert("Error", isPresented: $showError, actions: {
                Button(action: {
                    showError = false
                    iapViewModel.resetError()
                }, label: {
                    Text("OK")
                })
            }, message: {
                Text(iapViewModel.error)
            })
            .alert(localizedString(forKey: "restoreNoPurTit"), isPresented: $iapViewModel.showNoPendingTransactionsAlert , actions: {
                Button(action: {
                    iapViewModel.showNoPendingTransactionsAlert = false
                }, label: {
                    Text("OK")
                })
            }, message: {
                Text(localizedString(forKey: "restoreNoPurSubTit"))
            })
            .alert(localizedString(forKey: "restorePurTit"), isPresented: $iapViewModel.showPurchasesRestoredAlert , actions: {
                Button(action: {
                    iapViewModel.showPurchasesRestoredAlert = false
                }, label: {
                    Text("OK")
                })
            }, message: {
                Text(localizedString(forKey: "restorePurSubTit"))
            })
//            .overlay(content: {
//                if !reachability.isConnected {
//                    CustomAlertNetworkView()
//                }
//            })
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func makScrNThirdStage_ThorfinnApp(with geo: GeometryProxy) -> some View {
        
        VStack {
            HStack {
                if subViewModel.productType != .mainType {
                    Button(action: {
                        isShown = false
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    })
                }
                Spacer()
                Button(action: {
                    iapViewModel.restore()
                }, label: {
                    Text(localizedString(forKey: "restore"))
                })
                .font(Font.custom("SFProDisplay-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 22))
                .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 60, leading: 20, bottom: 0, trailing: 20))
            Spacer()
            VStack {
                HStack {
                    makTit_ThorfinnApp(with: subViewModel.currentTitle, isLeftAlignment: true, and : subViewModel.currentStage == .third ? true : false)
                    Spacer()
                }
                VStack(spacing: 10) {
                    ForEach(subViewModel.currentItems){ item in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 2) {
                                makeTitleStarProduct(with: item.title, and: true, fontSize: 12)
                                makeTitleStarProduct(with: item.subtitle, and: true, fontSize: 10)
                            }
                            Spacer()
                        }
                        .padding(.leading)
                    }
                }
                
                ScrollView(.vertical) {
                    HStack (alignment: .center) {
                        if !subViewModel.trialText.isEmpty {
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                            Text(subViewModel.trialText)
                                .foregroundColor(.white)
                                .minimumScaleFactor(0.2)
                                .font(Font.custom("Gilroy-Bold", size: 12 ))
                                .multilineTextAlignment(.center)
                                .lineLimit(2)

                        }
                    }
                    .frame(height: 30)
                    HStack {
                        Spacer()
                        CntnUeButt_ThorfinnApp(SubViewModel_SimulatorFarm: subViewModel, isShown: $isShown, thirdScr: true)
                            .frame(width: geo.size.width * (UIDevice.current.userInterfaceIdiom == .phone ? 0.9 : 0.5), height: UIDevice.current.userInterfaceIdiom == .phone ? 60 : geo.size.height / 15)
                            .environmentObject(reachability)
                        Spacer()
                    }
                    HStack {
                        makBottBUTT_APP(with: localizedString(forKey: "TermsID"), and: {
                            UIApplication.shared.open(URL(string: Configurations_.termsURLLink)!)
                        })
                        Spacer()
                        makBottBUTT_APP(with: localizedString(forKey: "PrivacyID"), and: {
                            UIApplication.shared.open(URL(string: Configurations_.policyURLLink)!)
                        })
                    }
                    .padding([.leading, .trailing])
                    
                    Text(subViewModel.subsDesc)
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .padding([.horizontal, .top], 10)
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.leading)
                        .frame(width: geo.size.width * (UIDevice.current.userInterfaceIdiom == .phone ? 0.95 : 0.5))
                }
                .padding(.top, 5)
                .frame(height: getScrlHegt_ThorfinnApp(from: geo))
            }
        }
    }
    
    @ViewBuilder
    private func makeViewForFirstAndSecondStage_SimulatorFarm(with geo: GeometryProxy) -> some View {
        
        VStack {
            Spacer()
            VStack{
                makTit_ThorfinnApp(with: subViewModel.currentTitle, and : subViewModel.currentStage == .third ? true : false)
                if subViewModel.currentStage == .first {
                    makScrLLGrid_ThorfinnApp(with: geo)
                } else {
                    makScrLLGrid_ThorfinnApp(with: geo)
                }
                HStack {
                    Spacer()
                    CntnUeButt_ThorfinnApp(SubViewModel_SimulatorFarm: subViewModel, isShown: $isShown, thirdScr: false)
                        .frame(width: geo.size.width * (UIDevice.current.userInterfaceIdiom == .phone ? 0.9 : 0.5), height: UIDevice.current.userInterfaceIdiom == .phone ? 60 : geo.size.height / 15)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 42, trailing: 0))
            }
        }
    }
    
    private func makScrLLGrid_ThorfinnApp(with geo: GeometryProxy) -> some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            makGrDAPP(with: geo)
        }
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        .frame(width: geo.size.width, height: geo.size.height / (UIDevice.current.userInterfaceIdiom == .phone ? 6 : 8))
    }
    
    @ViewBuilder
    private func makGrDAPP(with geo: GeometryProxy) -> some View {
        
        var simplicFunc_ThorfinnApp:Int {
            let ThorfinnViking = "SkOl"
            let ThorfinnFtherViking = "England"
            return ThorfinnViking.count + ThorfinnFtherViking.count
        }
        
        LazyHGrid(rows: [GridItem(.fixed(geo.size.height / (UIDevice.current.userInterfaceIdiom == .pad ? 9.5 : 7)))], spacing: geo.size.width / (UIDevice.current.userInterfaceIdiom == .pad ? 40 : 20)){
            ForEach(subViewModel.currentItems){ item in
            ZStack {
                Color(subViewModel.selectedCells.contains(item.id) ? .lightGray : .gray)
                VStack {
                    makCellImg_ThorfinnApp(with: item.imageName, and: subViewModel.selectedCells.contains(item.id) ? true : false)
                    makText_ThorfinnApp(with: item.title, and: subViewModel.selectedCells.contains(item.id) ? true : false)
                }
            }
            .cornerRadius(UIDevice.current.userInterfaceIdiom == .phone ? 6 : 8)
            .onTapGesture {
                withAnimation(Animation.easeInOut(duration: 0.25)) {
                    subViewModel.relCeLlAPP(with: item.id)
                }
            }
            .scaleEffect(subViewModel.selectedCells.contains(item.id) ? 1.15 : 1)
            .frame(width: geo.size.width / (UIDevice.current.userInterfaceIdiom == .pad ? 9 : (UIDevice.current.hasPhysicalButton ? 5 : 4)), height: geo.size.height / (UIDevice.current.userInterfaceIdiom == .pad ? 10.5 : 7))
                                        }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
    
    @ViewBuilder
    private func makText_ThorfinnApp(with text: String, and activate: Bool, fontSize: CGFloat = 10, maxLines: Int = 1) -> some View {
        
        Text(text.uppercased())
            .minimumScaleFactor(0.2)
            .font(Font.custom("PollerOne-Regular", size: 12))
            .multilineTextAlignment(.center)
            .lineLimit(maxLines)
            .foregroundColor(activate ? Color(red: 1, green: 1, blue: 1, alpha: 1) : Color(red: 1, green: 1, blue: 1, alpha: 0.5))
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
    }
    
    @ViewBuilder
    private func makeTitleStarProduct(with text: String, and activate: Bool, fontSize: CGFloat = 10, maxLines: Int = 1) -> some View {
        
        var simplicFunc_ThorfinnApp:Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        let asianLanguageCodes = ["zh", "ja", "ko"]
        let currentLanguageCode = Locale.current.languageCode
        let boolText = asianLanguageCodes.contains(currentLanguageCode!)
        
        let halfLength = text.count / 2
        
        let truncatedText = String(text.prefix(halfLength))
        
        Text( fontSize == 10 ? (boolText ? truncatedText : text) : text.uppercased())
            .minimumScaleFactor(0.2)
            .font(Font.custom("Gilroy-Black", size: fontSize))
            .multilineTextAlignment(.center)
            .lineLimit(maxLines)
            .foregroundColor(activate ? Color(red: 1, green: 1, blue: 1, alpha: 1) : Color(red: 1, green: 1, blue: 1, alpha: 0.5))
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
    
    @ViewBuilder
    private func makBottBUTT_APP(with text: String, and action: @escaping () -> Void) -> some View {
        
        Button(action: {
            action()
        }, label: {
            Text(text)
                .underline(true, color: .white)
                .minimumScaleFactor(0.2)
                .font(Font.custom("Poppins-Medium", size: 12))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundColor(.white)
        })
    }
    
    @ViewBuilder
    private func makCellImg_ThorfinnApp(with name: String, and activate: Bool) -> some View {
        
        Image(activate ? "card_activ" : "card_inaktiv")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
    
    @ViewBuilder
    private func makTit_ThorfinnApp(with text: String, isLeftAlignment: Bool = false, and activate: Bool) -> some View {
        
        if (activate) {
            HStack{
                Text(localizedString(forKey: "SliderID1tap") + " ") +
                Text(localizedString(forKey: "iOSButtonID") + " ")
                    .foregroundColor(Color(#colorLiteral(red: 0.6189979911, green: 0.8866835237, blue: 1, alpha: 1))) +
                Text(localizedString(forKey: "SliderID1to") + " ") +
                Text(localizedString(forKey: "SliderID1_entrance"))
            }
            .multilineTextAlignment(isLeftAlignment ? .leading : .center)
            .font(Font.custom("Gilroy-Black", size: 24))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        } else {
            Text(text)
                .multilineTextAlignment(isLeftAlignment ? .leading : .center)
                .font(Font.custom("Gilroy-Black", size: 24))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
        
    }
    
    @ViewBuilder
    private func mkePlyRView_ThorfinnApp() -> some View {
        
        PlyrView_ThorfApplec(videoName: UIDevice.current.userInterfaceIdiom == .pad ? ConfigMdiASUb_ThorfinnApp.nameFileVideoForPad : ConfigMdiASUb_ThorfinnApp.nameFileVideoForPhone, player: player)
            .aspectRatio(contentMode: .fill)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                player.play()
            }
            .onReceive(NotificationCenter.default.publisher(for: AVAudioSession.interruptionNotification)) { notification in
                haNdInterAPP(notification: notification)
            }
    }
    
    private func haNdInterAPP(notification: Notification) {
        
        guard let info = notification.userInfo,
            let typeValue = info[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            // Interruption began, take appropriate actions (save state, update user interface)
            player.pause()
        } else if type == .ended {
            guard let optionsValue =
                info[AVAudioSessionInterruptionOptionKey] as? UInt else {
                    return
            }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                // Interruption Ended - playback should resume
                player.play()
            }
        }
    }
    
    private func getScrlHegt_ThorfinnApp(from geo: GeometryProxy) -> CGFloat {
        
        return (UIDevice.current.userInterfaceIdiom == .phone ? 60 : geo.size.height / 15) + 87
    }
    
}

struct SubView_ThorfinnApp_Previews: PreviewProvider {
    static var previews: some View {
        SubView_ThorFinnApp(subViewModel:SUBVM_ThorfinnApp (productType: .mainType), isShown: .constant(true))
            .environmentObject(IAPManager_())
    }
}

enum TypeSystemFORapplication {
    //MARK: Current device type: iPhone, iPad, Mac
    enum Oftyp_SystemAppl{
        case iphone,ipad,mac
    }
    
    static var deviceType:Oftyp_SystemAppl{
#if os(macOS)
        return .mac
#else
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .ipad
        }
        else {
            return .iphone
        }
#endif
    }
}
