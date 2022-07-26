//
//  UIApplication.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/24/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    // to dismiss keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for:nil)
    }
}
