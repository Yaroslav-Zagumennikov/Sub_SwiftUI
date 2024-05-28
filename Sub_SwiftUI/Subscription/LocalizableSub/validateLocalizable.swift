//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import Foundation


func localizedString(forKey key: String) -> String {
    var result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)

    if result == key {
        result = Bundle.main.localizedString(forKey: key, value: nil, table: "LocalizableSub")
    }

    return result
}
