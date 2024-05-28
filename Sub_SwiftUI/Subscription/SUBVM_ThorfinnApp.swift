//
//  SubViewModel_SimulatorFarm.swift
//  Tamagochi
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import Foundation

class SUBVM_ThorfinnApp: ObservableObject {
    
    // MARK: - Properties
    
    @Published private var subLogic: SbLogc_ThorfinnApp
    @Published private(set) var productPrice = "$4.99"
    @Published private(set) var subsDesc = String()
    
    let productType: PrductTpe_ThorfinnApp
    
    var currentTitle: String {
        subLogic.currentViewModel.title
    }
    
    var currentItems: [RusblECntentCell_ThorfinnApp] {
        subLogic.currentViewModel.items
    }
    
    var selectedCells: [Int] {
        subLogic.selectedCells
    }
    
    var currentStage: Stges_SUB_ThorfinnApp {
        subLogic.currentStage
    }
    
    var trialText: String {
        return subLogic.trialText

//        if Locale.current.identifier.contains("en") {
//            return subLogic.trialText
//        }
//        else {
//            return ""
//        }
    }
    
    // MARK: Inits
    
    init(productType: PrductTpe_ThorfinnApp) {
        self.productType = productType
        switch productType {
        case .mainType:
            subLogic = SbLogc_ThorfinnApp(stage: .first)
        case .modsType:
            subLogic = SbLogc_ThorfinnApp(stage: .third)
        case .farmsType:
            subLogic = SbLogc_ThorfinnApp(stage: .third)
        case .otherType:
            subLogic = SbLogc_ThorfinnApp(stage: .third)
        }
    }
    
    // MARK: - Intents
    
    func updProdPre_SUB_ThorfinnApp(with newValue: String) {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        subLogic.updProdPre_SUB_ThorfinnApp(with: newValue)
        productPrice = newValue
        subsDesc = localizedString(forKey: "iOSAfterID").rplcPricWthNewPrc_SUB(newPriceString: productPrice)
    }
    
    func relCeLlAPP(with id: Int) {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }

        //
        
        subLogic.relCeLlAPP(with: id)
    }
    
    func updStg_SUB(with newValue: Stges_SUB_ThorfinnApp) {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }

        //
        
        subLogic.updStg_SUB(with: newValue)
    }
    
    func conTButTActon_SUB_Thorf() {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        switch subLogic.currentStage {
        case .first:
            updStg_SUB(with: .second)
        case .second:
            updStg_SUB(with: .third)
        case .third:
            print(1)
        }
    }
    
}

