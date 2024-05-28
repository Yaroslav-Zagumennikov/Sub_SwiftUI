//
//  SubLogic_SimulatorFarm.swift
//  Tamagochi
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import Foundation

struct RusbleVM_ThorfinnApp {
    var title: String
    var items: [RusblECntentCell_ThorfinnApp]
}

struct RusblECntentCell_ThorfinnApp: Identifiable {
    var id: Int
    var title: String
    var subtitle: String = ""
    var imageName: String
    var selectedImageName: String
}

struct SbLogc_ThorfinnApp {
    
    // MARK: - Properties
    
    private(set) var currentStage = Stges_SUB_ThorfinnApp.first
    private(set) var currentViewModel: RusbleVM_ThorfinnApp
    private(set) var selectedCells = [Int]()
    private(set) var trialText = localizedString(forKey: "SliderNoPayment")
    
    // MARK: - Inits
    
    init(stage: Stges_SUB_ThorfinnApp) {
        currentStage = stage
        currentViewModel =  RusbleVM_ThorfinnApp(title: localizedString(forKey: "Text0ID").uppercased(), items: SbLogc_ThorfinnApp.generoUSContForSCREEn_SUB(for: .first))
        updStg_SUB(with: stage)
    }
    
    // MARK: - Methods
    
    mutating func updProdPre_SUB_ThorfinnApp(with newValue: String) {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        trialText = trialText.replacingOccurrences(of: "$4.99", with: newValue)
    }
    
    mutating func relCeLlAPP(with id: Int) {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        if let indexOfID = selectedCells.firstIndex(of: id) {
            selectedCells.remove(at: indexOfID)
        }
        else {
            selectedCells.append(id)
        }
    }
    
    mutating func updStg_SUB(with newValue: Stges_SUB_ThorfinnApp) {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        //
        
        selectedCells = []
        currentStage = newValue
        switch currentStage {
        case .first:
            currentViewModel =  RusbleVM_ThorfinnApp(title: localizedString(forKey: "Text0ID").uppercased(), items: SbLogc_ThorfinnApp.generoUSContForSCREEn_SUB(for: currentStage))
        case .second:
            currentViewModel =  RusbleVM_ThorfinnApp(title: localizedString(forKey: "Text17ID").uppercased(), items: SbLogc_ThorfinnApp.generoUSContForSCREEn_SUB(for: currentStage))
        case .third:
            currentViewModel =  RusbleVM_ThorfinnApp(title: localizedString(forKey: "SliderID1_entrance").uppercased(), items: SbLogc_ThorfinnApp.generoUSContForSCREEn_SUB(for: currentStage))
        }
    }
    
    private static func generoUSContForSCREEn_SUB(for stage: Stges_SUB_ThorfinnApp) -> [RusblECntentCell_ThorfinnApp] {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        var contentForCV : [RusblECntentCell_ThorfinnApp] = []
        switch stage {
        case .first:
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 1, title: localizedString(forKey:"Sub_s0_i0"), imageName: "1_1des", selectedImageName: "1_1sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 2, title: localizedString(forKey:"Sub_s0_i1"), imageName: "1_2des", selectedImageName: "1_2sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 3, title: localizedString(forKey:"Sub_s0_i2"), imageName: "1_3des", selectedImageName: "1_3sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 4, title: localizedString(forKey:"Sub_s0_i3"), imageName: "1_4des", selectedImageName: "1_4sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 5, title: localizedString(forKey:"Sub_s0_i4"), imageName: "1_5des", selectedImageName: "1_5sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 6, title: localizedString(forKey:"Sub_s0_i5"), imageName: "1_6des", selectedImageName: "1_6sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 7, title: localizedString(forKey:"Sub_s0_i6"), imageName: "1_7des", selectedImageName: "1_7sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 8, title: localizedString(forKey:"Sub_s0_i7"), imageName: "1_8des", selectedImageName: "1_8sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 9, title: localizedString(forKey:"Sub_s0_i8"), imageName: "1_8des", selectedImageName: "1_8sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 10, title: localizedString(forKey:"Sub_s0_i9"), imageName: "1_8des", selectedImageName: "1_8sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 11, title: localizedString(forKey:"Sub_s0_i10"), imageName: "1_8des", selectedImageName: "1_8sel"))
        case .second:
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 1, title: localizedString(forKey:"Sub_s1_i0"), imageName: "2_1des", selectedImageName: "2_1sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 2, title: localizedString(forKey:"Sub_s1_i1"), imageName: "2_2des", selectedImageName: "2_2sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 3, title: localizedString(forKey:"Sub_s1_i2"), imageName: "2_3des", selectedImageName: "2_3sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 4, title: localizedString(forKey:"Sub_s1_i3"), imageName: "2_4des", selectedImageName: "2_4sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 5, title: localizedString(forKey:"Sub_s1_i4"), imageName: "2_5des", selectedImageName: "2_5sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 6, title: localizedString(forKey:"Sub_s1_i5"), imageName: "2_6des", selectedImageName: "2_6sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 7, title: localizedString(forKey:"Sub_s1_i6"), imageName: "2_7des", selectedImageName: "2_7sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 8, title: localizedString(forKey:"Sub_s1_i7"), imageName: "2_8des", selectedImageName: "2_8sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 9, title: localizedString(forKey:"Sub_s1_i8"), imageName: "2_8des", selectedImageName: "2_8sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 10, title: localizedString(forKey:"Sub_s1_i9"), imageName: "2_8des", selectedImageName: "2_8sel"))
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 11, title: localizedString(forKey:"Sub_s1_i10"), imageName: "2_8des", selectedImageName: "2_8sel"))
        case .third:
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 1, title: localizedString(forKey:"SliderID2_entrance"), subtitle: localizedString(forKey:"SliderID2sub_entrance"), imageName: "", selectedImageName: ""))
            if Locale.current.languageCode == "en" {
                contentForCV.append(RusblECntentCell_ThorfinnApp(id: 2, title: localizedString(forKey:"SliderID3"), subtitle: localizedString(forKey:"SliderID3sub"), imageName: "", selectedImageName: ""))
            }
            contentForCV.append(RusblECntentCell_ThorfinnApp(id: 3, title: localizedString(forKey:"SliderID4_entrance"), subtitle: localizedString(forKey:"SliderID4sub_entrance"), imageName: "", selectedImageName: ""))
        }
        return contentForCV
    }
    
}

enum Stges_SUB_ThorfinnApp: String {
    case first
    case second
    case third
}
