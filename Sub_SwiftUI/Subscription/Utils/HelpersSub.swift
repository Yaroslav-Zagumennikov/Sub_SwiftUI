//
//  Helpers.swift
//  SubTemplateSwiftUI
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import Foundation
import UIKit
import SwiftUI

enum PrductTpe_ThorfinnApp: String, CaseIterable {
    case mainType
    case modsType
    case farmsType
    case otherType
    
    var productID: String {
        switch self {
        case .mainType:
            return Configurations_.mainSubscriptionID_VDI
        case .modsType:
            return Configurations_.unlockMDDSubscriptionID
        case .farmsType:
            return Configurations_.unlockMPPSubscriptionID
        case .otherType:
            return Configurations_.unlockerCHARSubscriptionID
        }
    }
}

enum PrchseErr_SbThorfinnApp: String {
    case none
    case invalidProduct = "Invalid Product"
    case needApproval = "Need Approval"
}

typealias UIDvcE_ThorfinnApp = UIDevice

extension UIDvcE_ThorfinnApp {
    
    var hasPhysicalButton: Bool {
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) {
            return windowScene.windows
                .map { $0.safeAreaInsets.bottom }
                .contains(where: { $0 == 0 })
        }
        return false
    }
    
}

typealias Colr_ThorfinnApp = Color

public extension Colr_ThorfinnApp {
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.init(
            .sRGB,
            red: Double(red),
            green: Double(green),
            blue: Double(blue),
            opacity: Double(alpha)
        )
    }
    
}

typealias TsK_ThorfinnApplic = Task

extension TsK_ThorfinnApplic where Success == Never, Failure == Never {
    
    static func slp_SUBThorfin(seconds: Double) async {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
    
}

typealias String_ThorfApplic = String; extension String_ThorfApplic {
    
    func rplcPricWthNewPrc_SUB(newPriceString: String) -> String {
        
        

        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        //
        
        var result = self.replacingOccurrences(of: "4.99", with: newPriceString.replacingOccurrences(of: "$", with: ""))
        result = result.replacingOccurrences(of: "4,99", with: newPriceString.replacingOccurrences(of: "$", with: ""))
        return result
    }
    
}
