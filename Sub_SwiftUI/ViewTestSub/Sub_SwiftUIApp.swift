//
//  Sub_SwiftUIApp.swift
//  Sub_SwiftUI
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import SwiftUI

@main
struct Sub_SwiftUIApp: App {
    @StateObject var reachability = RechbilitY_ThorfinnApp()
    @StateObject var iapManager = IAPManager_()
    private var subViewModel = SUBVM_ThorfinnApp(productType: .mainType)
    @State var isShown = true

    var body: some Scene {
        WindowGroup {
            if iapManager.isLoadingProducts {
                Color.black.ignoresSafeArea()
            } else if iapManager.boughtProducts.contains(.mainType) {
                MainSubView()
                    .environmentObject(reachability)
                    .environmentObject(iapManager)
            } else {
                SubView_ThorFinnApp(subViewModel: subViewModel, isShown: $isShown)
                    .environmentObject(reachability)
                    .environmentObject(iapManager)
                    .transition(AnyTransition.asymmetric(insertion: AnyTransition.identity, removal: AnyTransition.move(edge: Edge.top)))
            }
        }
    }
}
